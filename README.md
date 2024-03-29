# MMKSI VTS Mobile

[![Flutter CI with Github Actions on SFID](https://github.com/abdur-rohman2883/SOIDMobile/actions/workflows/actions.yml/badge.svg)](https://github.com/abdur-rohman2883/SOIDMobile/actions/workflows/actions.yml)

## Branching

Developement -> Staging -> Production

1. newproduction : released on Play Store or App Store [Production]
2. staging : use production setting and environment, but not released yet [Staging-v2.0.2]
3. development : use development setting and environment for development purpose [Dev-HospitalFeature]
4. operation : merge to this branch to handle change request [OPR-Payroll]

## Yang Perlu di perhatikan saat Ubah setting environment

1. check version di pubspeck.yaml, update versionnya
2. pastikan url di .env sudah sesuai
3. file google_service.json gunakan sesuai environment
4. file google_service.plist sesuaikan dengan environment
5. package name di sesuaikan
6. root module log interceptor saat production dimatikan
7. naikin flutter version code sama naikin flutter version name
8. nama aplikasi [MMKSI VTS Mobile Mobile] <-> [MMKSI VTS Mobile Test]
9. setting block unblock untuk capture screen

## Rollback

Use tag version for rollback

## This project implementing [Flutter Clean Architecture]

- https://pub.dev/packages/flutter_clean_architecture
- https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html

## Please Write using Clean Code convention

## Unit Test

Running unit test first, before running this project.

```
flutter pub run build_runner build --delete-conflicting-outputs
flutter test --coverage
```

## Requirements

- Flutter Version : 2.2.0
- Don't forget to run `flutter pub get` first

## Convetions and MUST DOs

https://dart-lang.github.io/linter/lints/

## Languange and Localization

- Every text or string like informations, messages, etc. should be registered inside `lib/app/ui/res/string` and register them with key naming format `snake_case`.
- After all registered then run `flutter pub run gen_lang:generate --source-dir=lib/app/ui/res/string --output-dir=lib/app/ui/res/generated --template-locale=id`
- After done you can use the registered string like example: `S.of(context).login_error_message`
- Convetions for naming key: `{pages}_{intention/functionality}`

Last update by: Abdur Rohman

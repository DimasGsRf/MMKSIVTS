import 'package:injector/injector.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/di/controller_module.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/di/mapper_module.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/di/presenter_module.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/di/repository_module.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/di/root_module.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/di/use_case_module.dart';

// Commonly here to declare dependency injection
class AppComponent {
  static void init() {
    Injector injector = getInjector();
    RootModule.init(injector);
    MapperModule.init(injector);
    RepositoryModule.init(injector);
    UseCaseModule.init(injector);
    PresenterModule.init(injector);
    ControllerModule.init(injector);
  }

  static Injector getInjector() {
    return Injector.appInstance;
  }

  static Future<void> refresh() async {
    getInjector().clearAll();
    init();
  }
}

import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:event_bus/event_bus.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/app_component.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/after_login.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/connection.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/dio_error.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/error.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/exit.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/loading.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/logout.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/notification.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/reset_ui.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/success.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/router.dart'
    as CustomRouter;
import 'package:mmksi_vts_mobile/app/misc/constants.dart';
import 'package:mmksi_vts_mobile/app/misc/string_utils.dart';
import 'package:mmksi_vts_mobile/app/misc/user_data.dart';
import 'package:mmksi_vts_mobile/app/misc/utils.dart';
import 'package:mmksi_vts_mobile/app/ui/pages/pages.dart';
import 'package:mmksi_vts_mobile/app/ui/pages/post/view.dart';
import 'package:mmksi_vts_mobile/app/ui/res/generated/i18n.dart';
import 'package:mmksi_vts_mobile/app/ui/widgets/dialog.dart';
import 'package:mmksi_vts_mobile/app/ui/widgets/loading.dart';
import 'package:mmksi_vts_mobile/data/payload/api/user/update_firebase_token_payload.dart';
import 'package:mmksi_vts_mobile/data/persistences/repositories/contracts/user_repository.dart';

main() async {
  await Future.wait([
    dotenv.load(fileName: '.env'),
    _initFabric()
  ]); // load env and init fabric / crashlytic

  AppComponent.init(); // init dependency

  _initBackgroundMessage(); // init firebase messaging on background message

  // bypass SSL when debug mode
  if (kDebugMode || kReleaseMode) HttpOverrides.global = SSLHttpOverrides();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runZonedGuarded<Future<void>>(() async {
        runApp(MyApp()); // run app
      }, FirebaseCrashlytics.instance.recordError);
    },
  );
}

Future<void> _handleOnBackgrundFirebaseMessaging(
    RemoteMessage remoteMessage) async {
  Map<String, dynamic> message = remoteMessage.data;

  await AppComponent.refresh();

  final UserData _userData = AppComponent.getInjector().get<UserData>();
  final EventBus _eventBus = AppComponent.getInjector().get<EventBus>();

  // save flag to user data
  _userData.hasNotifications = true;
  await _userData.save();

  if (message['type'] == "new_notification") {
    // fire event
    Future.delayed(
      Duration(seconds: 1),
      () => _eventBus.fire(
        NotificationEvent(AppConstants.NEW_NOTIFICATION, message.toString()),
      ),
    );
  } else {
    if (message['key'] != "new_material") return;

    var title = message['type'];
    var msg = "none";
    switch (title) {
      case "guide":
        msg = "new_guide";
        break;
      case "bulletin":
        msg = "new_bulletin";
        break;
      case "training":
        msg = "new_training";
        break;
      case "info":
        msg = "new_info";
        break;
      default:
        break;
    }

    Future.delayed(
      Duration(seconds: 1),
      () => _eventBus.fire(
        NotificationEvent(AppConstants.NEW_MATERIAL, msg),
      ),
    );
  }
}

void _initBackgroundMessage() {
  FirebaseMessaging.onBackgroundMessage(_handleOnBackgrundFirebaseMessaging);
}

Future<void> _initFabric() async {
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
    kReleaseMode,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}

class MyApp extends StatelessWidget {
  final CustomRouter.Router _router;
  final FirebaseMessaging _firebaseMessaging =
      AppComponent.getInjector().get<FirebaseMessaging>();
  final UserData _userData = AppComponent.getInjector().get<UserData>();
  final EventBus _eventBus = AppComponent.getInjector().get<EventBus>();
  final FlutterLocalNotificationsPlugin _notification =
      AppComponent.getInjector().get<FlutterLocalNotificationsPlugin>();
  final FirebaseAnalyticsObserver _observer =
      AppComponent.getInjector().get<FirebaseAnalyticsObserver>();
  final _navigatorKey = GlobalKey<NavigatorState>();

  // track internet connection status
  static bool isConnectedToInternet = true;

  int _notificationCount = 0;

  MyApp() : _router = CustomRouter.Router() {
    _initLogger(); // init logger
    _initNotification();
    _initEventListeners();
    _initConnectionListener();
  }

  @override
  Widget build(BuildContext context) {
    // init FCM on build
    _initFCM();

    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        // to generate string: flutter pub run gen_lang:generate --source-dir=lib/app/ui/res/string --output-dir=lib/app/ui/res/generated --template-locale=id
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale('id'),
        title: "SFD Mobile",
        theme: ThemeData(
          fontFamily: 'MMC',
          backgroundColor: AppConstants.COLOR_PRIMARY_BACKGROUND,
          primaryColor: AppConstants.COLOR_PRIMARY_COLOR,
        ),
        home: PostsPage(),
        onGenerateRoute: _router.getRoute,
        navigatorObservers: [_router.routeObserver, _observer],
      ),
    );
  }

  void _initLogger() {
    Logger.root.level = Level.ALL;
    Logger.root.info("Logger initialized.");
  }

  void _handleFirebaseMessage(RemoteMessage remoteMessage) async {
    final message = remoteMessage.data;

    // save flag to user data
    _userData.hasNotifications = true;

    await _userData.save();

    if (message['type'] == "new_notification") {
      // fire event
      _eventBus.fire(
          NotificationEvent(AppConstants.NEW_NOTIFICATION, message.toString()));
    } else {
      _handleNewMaterialNotification(remoteMessage);
    }

    _showNotification(remoteMessage);
  }

  void _openNotificationPage(RemoteMessage remoteMessage) async {
    final context = _navigatorKey.currentState?.overlay?.context;

    _notificationCount = _userData.notificationCount;
    _notificationCount++;

    _userData.notificationCount = _notificationCount;
    _userData.save();

    if (context != null && _notificationCount == 1) {
      Navigator.pushNamed(context, Pages.notification);
    }
  }

  void _initFCM() async {
    if (StringUtils.isEmpty(_userData.position)) return; // stop

    FirebaseMessaging.onMessage.listen(_handleFirebaseMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_openNotificationPage);
    FirebaseMessaging.instance.getInitialMessage().then((remoteMessage) {
      if (remoteMessage != null) _openNotificationPage(remoteMessage);
    });

    await Future.wait([
      // iOS Notification Permission
      _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      ),

      // Enable Foreground Notification
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      )
    ]);

    _firebaseMessaging.getToken().then((String? token) async {
      _userData.fcmToken = token;
      await _userData.save();
      if (_userData.salesCode?.contains('S-') ?? false) {
        Utils.getAllTopics(
                _userData.position ?? "",
                _userData.dealerGroup ?? "",
                _userData.dealerCity ?? "",
                _userData.dealerCode ?? "",
                _userData.dealerName?.replaceAll(RegExp(r','), '') ?? "",
                _userData.dealerArea ?? "",
                _userData.teamCategory ?? "")
            .forEach((topic) {
          _firebaseMessaging.subscribeToTopic(topic);
        });
      } else {
        Utils.getAllTopics(
                _userData.position ?? "",
                "_userData.dealerGroup",
                "_userData.dealerCity",
                "_userData.dealerCode",
                "_userData.dealerName",
                "_userData.dealerArea",
                "_userData.teamCategory")
            .forEach((topic) {
          _firebaseMessaging.subscribeToTopic(topic);
        });
      }

      // also subscribe to new material notif
      _firebaseMessaging.subscribeToTopic(AppConstants.NEW_MATERIAL);

      // update firebase token
      AppComponent.getInjector()
          .get<UserRepository>()
          .updateFirebaseToken(UpdateFirebaseTokenApiRequest(token ?? ""));
    });
  }

  void _initEventListeners() {
    _eventBus.on<DioErrorEvent>().listen((event) {
      if (!isConnectedToInternet) {
        _eventBus.fire(ResetUIEvent());
        return;
      }

      Widget iconX = const RotationTransition(
        turns: AlwaysStoppedAnimation(45 / 360),
        child: Icon(
          Icons.add_circle,
          color: AppConstants.COLOR_WHITE,
          size: 24,
        ),
      );

      if (event.code == 401) {
        iconX = Icon(
          Icons.warning,
          color: AppConstants.COLOR_WHITE,
          size: 24,
        );
      }

      var overlayContext = _navigatorKey.currentState?.overlay?.context;
      if (overlayContext != null) {
        showDialog(
          barrierDismissible: false,
          context: overlayContext,
          builder: (context) => CustomDialog.errorDialogRounded(
            icon: iconX,
            context: context,
            title: event.code == 401
                ? S.of(context).token_expired_title
                : S.of(context).label_failed,
            content: event.code == 401
                ? S.of(context).token_expired_content
                : StringUtils.getAlertContent(
                    context,
                    event.origin ?? "",
                    event.message ?? "",
                  ),
            onConfirmText: StringUtils.getAlertButtonTxt(
              context,
              event.origin ?? "",
            ),
            onConfirm: () {
              Navigator.pop(context);

              if (event.code == 401) {
                _handleLogout(context, "default");
              } else {
                _eventBus.fire(ResetUIEvent());
              }
            },
          ),
        );
      }
    });

    _eventBus.on<LogoutEvent>().listen((event) {
      _handleLogout(
        _navigatorKey.currentState?.overlay?.context,
        "default",
      );
    });

    _eventBus.on<ErrorEvent>().listen((event) {});

    _eventBus.on<AfterLoginEvent>().listen((event) {
      _userData.loadData();
      Future.delayed(Duration(seconds: 5), _initFCM);
    });

    _eventBus.on<ExitEvent>().listen((event) {
      var overlayContext = _navigatorKey.currentState?.overlay?.context;
      if (overlayContext != null) {
        showDialog(
          barrierDismissible: false,
          context: overlayContext,
          builder: (context) => CustomDialog.confirmDialogRounded(
            context: context,
            title: S.of(context).alert_dialog_cancel_title,
            content: S.of(context).alert_dialog_cancel_content,
            onConfirmText: S.of(context).label_yes,
            onCancelText: S.of(context).label_no,
            onConfirm: () {
              if (event.needLogout) {
                this._handleLogout(context, event.reason, needExit: true);
              } else {
                exit(0);
              }
            },
            onCancel: () {
              Navigator.pop(context);
            },
          ),
        );
      }
    });

    _eventBus.on<SuccessEvent>().listen((event) {
      var overlayContext = _navigatorKey.currentState?.overlay?.context;
      if (overlayContext != null) {
        showDialog(
          context: overlayContext,
          builder: (context) => CustomDialog.successDialogRounded(
            context: context,
            title: event.title,
            content: Text('${event.content}'),
            onConfirm: event.onConfirm! as VoidCallback,
            onConfirmText: event.confirmText ?? "",
          ),
        );
      }
    });

    _eventBus.on<LoadingEvent>().listen((event) {
      var overlayContext = _navigatorKey.currentState?.overlay?.context;
      if (overlayContext != null) {
        showDialog(
          barrierDismissible: false,
          barrierColor: Colors.transparent,
          context: overlayContext,
          builder: (context) => WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(child: CommonLoading()),
          ),
        );
      }
    });

    _eventBus.on<DismissLoadingEvent>().listen((event) {
      var overlayContext = _navigatorKey.currentState?.overlay?.context;
      if (overlayContext != null) {
        Navigator.of(overlayContext).pop();
      }
    });
  }

  void _initNotification() {
    _notification.initialize(
      AppComponent.getInjector().get<InitializationSettings>(),
    );
  }

  void _initConnectionListener() {
    FlutterDownloader.initialize();

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _handleCheckConnectivity(result);
    });
  }

  void _handleLogout(BuildContext? context, String reason, {needExit = false}) {
    _unsubscribeNotif();

    _userData.clearWithCallback(() {
      _userData.logoutReason = reason;
      _userData.lastUser = _userData.id;
      _userData.save()?.then((_) {
        if (needExit) {
          exit(0);
        } else {
          if (context != null) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Pages.login,
              (_) => false,
            );
          }
        }
      });
    });
  }

  void _unsubscribeNotif() {
    if (_userData.salesCode?.contains('S-') ?? false) {
      Utils.getAllTopics(
        _userData.position ?? "",
        _userData.dealerGroup ?? "",
        _userData.dealerCity ?? "",
        _userData.dealerCode ?? "",
        _userData.dealerName?.replaceAll(RegExp(r','), '') ?? "",
        _userData.dealerArea ?? "",
        _userData.teamCategory ?? "",
      ).forEach((topic) {
        _firebaseMessaging.unsubscribeFromTopic(topic);
      });
    } else {
      Utils.getAllTopics(
        _userData.position ?? "",
        "_userData.dealerGroup",
        "_userData.dealerCity",
        "_userData.dealerCode",
        "_userData.dealerName",
        "_userData.dealerArea",
        "_userData.teamCategory",
      ).forEach((topic) {
        _firebaseMessaging.unsubscribeFromTopic(topic);
      });
    }

    _firebaseMessaging.unsubscribeFromTopic(AppConstants.NEW_MATERIAL);
  }

  void _showNotification(RemoteMessage remoteMessage) async {
    await _notification.show(
      0,
      remoteMessage.notification?.title,
      remoteMessage.notification?.body,
      AppComponent.getInjector().get<NotificationDetails>(),
      payload: 'item x',
    );
  }

  void _handleNewMaterialNotification(RemoteMessage remoteMessage) async {
    if (remoteMessage.data['type'] != "new_material") return;

    var title = remoteMessage.data['type'];
    var msg = "none";
    switch (title) {
      case "guide":
        msg = "new_guide";
        break;
      case "bulletin":
        msg = "new_bulletin";
        break;
      case "training":
        msg = "new_training";
        break;
      case "info":
        msg = "new_info";
        break;
      default:
        break;
    }

    _eventBus.fire(NotificationEvent(AppConstants.NEW_MATERIAL, msg));
  }

  void _handleCheckConnectivity(ConnectivityResult result) async {
    try {
      if (result == ConnectivityResult.none) {
        isConnectedToInternet = false;
        _eventBus.fire(ConnectionEvent(false));
      } else {
        final connection = await InternetAddress.lookup('google.com');
        if (connection.isNotEmpty && connection[0].rawAddress.isNotEmpty) {
          isConnectedToInternet = true;
          _eventBus.fire(ConnectionEvent(true));
        }
      }
    } on SocketException catch (_) {
      isConnectedToInternet = false;
      _eventBus.fire(ConnectionEvent(false));
    }
  }
}

class SSLHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
}

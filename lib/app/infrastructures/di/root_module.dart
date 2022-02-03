import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:event_bus/event_bus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injector/injector.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/encrypter.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/ios_notification.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/persistences/db_service.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/time_converter.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/persistences/api_service.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/endpoints.dart';
import 'package:mmksi_vts_mobile/app/misc/constants.dart';
import 'package:mmksi_vts_mobile/app/misc/downloader.dart';
import 'package:mmksi_vts_mobile/app/misc/image_data.dart';
import 'package:mmksi_vts_mobile/app/misc/user_data.dart';
import 'package:mmksi_vts_mobile/data/infrastructures/api_service_interface.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

// Commonly here to declare dependency injection
class RootModule {
  static void init(Injector injector) {
    injector.registerSingleton<Endpoints>(
      () => Endpoints(dotenv.env['BASE_URL'] ?? ""),
    );

    injector.registerDependency<TimeConverter>(() => TimeConverter());

    injector.registerSingleton<UserData>(
      () => UserData(injector.get<Encrypter>()),
    );

    injector.registerSingleton<ImageData>(() => ImageData());

    injector.registerSingleton<FirebaseMessaging>(
      () => FirebaseMessaging.instance,
    );

    injector.registerDependency<Dio>(() {
      var dio = Dio();
      dio.options.connectTimeout = 60000;
      dio.options.receiveTimeout = 60000;

      var userData = injector.get<UserData>();
      var endpoints = injector.get<Endpoints>();

      // use for log response and request data
      if (!kReleaseMode) {
        dio.interceptors.add(
          LogInterceptor(
            requestBody: true,
            responseBody: true,
            requestHeader: true,
            responseHeader: false,
            request: true,
          ),
        );
      }

      dio.interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: endpoints.baseUrl)).interceptor,
      );

      var tokenCheck = userData.token?.isNotEmpty ?? false;
      var token = userData.token ?? "";

      if (userData.token != null && tokenCheck)
        dio.options.headers["Authorization"] = "Bearer " + token;
      dio.options.baseUrl = endpoints.baseUrl;

      (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
      return dio;
    });

    injector.registerSingleton<EventBus>(() => EventBus());

    injector.registerDependency<ApiServiceInterface>(
      () => ApiService(
        injector.get<Dio>(),
        injector.get<EventBus>(),
      ),
    );

    // notification manager
    injector.registerDependency<AndroidInitializationSettings>(
      () => AndroidInitializationSettings('app_icon'),
    );

    injector.registerDependency<IOSInitializationSettings>(() {
      var _eventBus = injector.get<EventBus>();
      return IOSInitializationSettings(onDidReceiveLocalNotification:
          (int? id, String? title, String? body, String? payload) async {
        _eventBus.fire(IOSNotification(id ?? 0, title ?? "", payload ?? ""));
      });
    });

    injector.registerDependency<InitializationSettings>(
      () => InitializationSettings(
        android: injector.get<AndroidInitializationSettings>(),
        iOS: injector.get<IOSInitializationSettings>(),
      ),
    );

    injector.registerDependency<FlutterLocalNotificationsPlugin>(
      () => FlutterLocalNotificationsPlugin(),
    );

    injector.registerDependency<AndroidNotificationDetails>(
      () => AndroidNotificationDetails(
        AppConstants.NOTIFICATION_CHANNEL_ID,
        AppConstants.NOTIFICATION_CHANNEL_NAME,
        AppConstants.NOTIFICATION_CHANNEL_DESCRIPTION,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      ),
    );

    injector.registerDependency<IOSNotificationDetails>(
      () => IOSNotificationDetails(),
    );

    injector.registerDependency<NotificationDetails>(
      () => NotificationDetails(
        android: injector.get<AndroidNotificationDetails>(),
        iOS: injector.get<IOSNotificationDetails>(),
      ),
    );

    injector.registerDependency<DBService>(
      () => DBService(injector.get<Future<Database>>()),
    );

    injector.registerSingleton<FirebaseAnalytics>(() => FirebaseAnalytics());

    injector.registerSingleton<FirebaseAnalyticsObserver>(
      () => FirebaseAnalyticsObserver(
        analytics: injector.get<FirebaseAnalytics>(),
      ),
    );

    injector.registerSingleton<Downloader>(() => Downloader());

    injector.registerDependency<Encrypter>(() => Encrypter());
  }

  static parseAndDecode(String response) => jsonDecode(response);

  static parseJson(String text) => compute(parseAndDecode, text);
}

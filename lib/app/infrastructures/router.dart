import 'package:flutter/material.dart';

class Router {
  late RouteObserver<PageRoute> routeObserver;

  Router() {
    routeObserver = RouteObserver<PageRoute>();
  }

  Route<dynamic>? getRoute(RouteSettings? settings) {
    switch (settings?.name) {
      // case Pages.main:
      //   return _buildRoute(settings, new MainPage());

      default:
        return null;
    }
  }

  // TODO: unused for right now
  MaterialPageRoute _buildRoute(RouteSettings? settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}

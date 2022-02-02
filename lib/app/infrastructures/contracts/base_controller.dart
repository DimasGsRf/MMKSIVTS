import 'package:connectivity/connectivity.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:sfid_mobile/app/infrastructures/app_component.dart';
import 'package:sfid_mobile/app/infrastructures/event/connection.dart';
import 'package:sfid_mobile/app/infrastructures/event/error.dart';
import 'package:sfid_mobile/app/infrastructures/event/reset_ui.dart';
import 'package:sfid_mobile/app/misc/route_arguments.dart';
import 'package:sfid_mobile/app/misc/view_utils.dart';

class BaseController extends Controller {
  late EventBus _eventBus = AppComponent.getInjector().get<EventBus>();

  bool _internetAvailable = true;
  bool get internetAvailable => _internetAvailable;

  RouteArguments? _args;
  RouteArguments? get args => _args;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  BaseController() : super() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void initListeners() {
    checkInternetConnection();

    _eventBus.on<ResetUIEvent>().listen((event) {
      dismissLoading();
      ViewUtils.dismissProgressDialog();
      refreshUI();
    });

    // Check if data/wifi is active every OS setting change
    _eventBus.on<ConnectionEvent>().listen((event) {
      if (event.isConnected) {
        internetAvailabilityCycle(true);
        refreshUI();
      } else {
        internetAvailabilityCycle(false);
        dismissLoading();
      }
    });
  }

  void internetAvailabilityCycle(bool status) {
    if (status) {
      _internetAvailable = status;
      onInternetDisconnected();
    } else {
      _internetAvailable = status;
      onInternetConnected();
    }
  }

  void onError({String title = "Error", String message = "Please try again!"}) {
    _eventBus.fire(ErrorEvent(message));
  }

  void checkInternetConnection() {
    // Check if data/wifi is active every init controller
    Connectivity().checkConnectivity().then((connection) {
      if (connection == ConnectivityResult.none) {
        dismissLoading();
        internetAvailabilityCycle(false);
        refreshUI();
      } else {
        internetAvailabilityCycle(true);
        refreshUI();
      }
    });
  }

  void onInternetConnected() {
    // do something
  }

  void onInternetDisconnected() {
    // do something
  }

  void onProgressLoading() {
    ViewUtils.showProgressDialog(getContext());
  }

  void onFinishLoading() {
    ViewUtils.dismissProgressDialog();
  }

  void delayedRefresh({int duration = 1}) {
    Future.delayed(Duration(seconds: duration), refreshUI);
  }

  void resetPage() {
    dismissLoading();
    refreshUI();
  }

  void dismissLoading() {
    _isLoading = false;
    refreshUI();
  }

  void showLoading() {
    _isLoading = true;
    refreshUI();
  }
}

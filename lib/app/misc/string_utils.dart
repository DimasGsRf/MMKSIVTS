import 'package:flutter/material.dart';
import 'package:mmksi_vts_mobile/app/ui/res/generated/i18n.dart';

class StringUtils {
  static String getAlertContent(
      BuildContext context, String origin, String defaultStr) {
    var response;
    switch (origin) {
      case "login.fail.salesman_not_registered":
        response =
            S.of(context).error_login_fail_salesman_not_registered_content;
        break;
      case "verify_vin.fail.vin_not_found":
        response = S.of(context).error_verify_vin_fail_not_found;
        break;
      default:
        response = defaultStr;
    }

    return response;
  }

  static String getAlertButtonTxt(BuildContext context, String origin) {
    var response;
    switch (origin) {
      case "login.fail.wrong_password":
      case "otp.fail.invalid_otp":
        response = S.of(context).label_try_again;
        break;
      default:
        response = S.of(context).label_back;
    }

    return response;
  }

  static String getValidTopicName(String str) {
    return str
        .replaceAll("[^A-Za-z0-9]", "")
        .replaceAll(" ", "")
        .trim()
        .toLowerCase();
  }

  static bool isEmpty(String? str) {
    return str == null || "" == str;
  }
}

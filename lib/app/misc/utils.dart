import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/app_component.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/event/error.dart';
import 'package:mmksi_vts_mobile/app/misc/string_utils.dart' as UtilsString;

class Utils {
  static int getCurrentTime() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  static String capitalize(String str) {
    return StringUtils.capitalize(str);
  }

  static Future<PackageInfo> getPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    return info;
  }

  static Future<String> loadAsset(path) async {
    return await rootBundle.loadString(path);
  }

  static String? appStore() {
    return dotenv.env['APP_STORE_URL'];
  }

  static String? playStore() {
    return dotenv.env['PLAY_STORE_URL'];
  }

  static bool? isDebug() {
    return dotenv.env['ENV'] == "debug";
  }

  static String? renameStatusType(type) {
    String renamed = 'Gambar';
    switch (type) {
      case 'all':
        renamed = 'Semua';
        break;
      case 'success':
        renamed = 'Sukses';
        break;
      case 'failed':
        renamed = 'Gagal';
        break;
      case 'draft':
        renamed = 'Draft';
        break;
    }
    return renamed;
  }

  static Future<String> getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    String identifier = "0000";
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        identifier = build.androidId;
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        identifier = data.identifierForVendor;
      }
    } on PlatformException catch (e) {
      AppComponent.getInjector()
          .get<EventBus>()
          .fire(new ErrorEvent(e.message ?? ""));
    }
    return identifier;
  }

  static String obscureText(String type, String value) {
    if (type == "email") {
      return value.split("@")[0].length <= 5
          ? value.replaceAll(RegExp(r'\w{2}@'), '**@')
          : value.replaceAll(RegExp(r'\w{5}@'), '*****@');
    } else {
      return value.replaceRange(4, 8, '****');
    }
  }

  static bool isEmail(String val) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val);
    return emailValid;
  }

  static String encodeBase64(File? file) {
    List<int> imageBytes = file?.readAsBytesSync() ?? [];
    return base64Encode(imageBytes);
  }

  static List<String> getAllTopics(
      String position,
      String dealerGroup,
      String dealerCity,
      String dealerCode,
      String dealerName,
      String dealerArea,
      String teamCategory) {
    List<String> topics = [];
    List<String> positions = [
      UtilsString.StringUtils.getValidTopicName(position),
      "all"
    ];
    List<String> groups = [
      UtilsString.StringUtils.getValidTopicName(dealerGroup),
      "all"
    ];
    List<String> cities = [
      UtilsString.StringUtils.getValidTopicName(dealerCity),
      "all"
    ];
    List<String> dealercode = [
      UtilsString.StringUtils.getValidTopicName(dealerCode),
      "all"
    ];
    List<String> delername = [
      UtilsString.StringUtils.getValidTopicName(dealerName),
      "all"
    ];
    List<String> dealerareas = [
      UtilsString.StringUtils.getValidTopicName(dealerArea),
      "all"
    ];
    List<String> teamcategory = [
      UtilsString.StringUtils.getValidTopicName(teamCategory),
      "all"
    ];

    for (var i = 0; i < positions.length; i++) {
      var position = positions[i];
      for (var j = 0; j < groups.length; j++) {
        String group = groups[j];
        for (var k = 0; k < cities.length; k++) {
          String city = cities[k];
          for (var l = 0; l < dealercode.length; l++) {
            String code = dealercode[l];
            for (var m = 0; m < delername.length; m++) {
              String name = delername[m];
              for (var n = 0; n < dealerareas.length; n++) {
                String area = dealerareas[n];
                for (var o = 0; o < teamcategory.length; o++) {
                  String team = teamcategory[o];
                  topics.add(position +
                      "-" +
                      group +
                      "-" +
                      city +
                      "-" +
                      code +
                      "-" +
                      name +
                      "-" +
                      area +
                      "-" +
                      team);
                }
              }
            }
          }
        }
      }
    }
    return topics;
  }

  static Future<Directory?> getAvailableFolder(BuildContext context) async {
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory;
  }

  static Future<String> getDownloadPath(BuildContext context) async {
    final directory = await getAvailableFolder(context);
    var loc = new Directory(
        directory?.path ?? "" + Platform.pathSeparator + 'Download');
    if (!loc.existsSync()) {
      loc.createSync(recursive: true);
    }
    return loc.path;
  }

  static bool checkIsEmpty(String val) {
    return val != "" && val != "-" && val.isNotEmpty && val != "null";
  }

  static String numberFormat(double number) {
    // final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
    final formatCurrency = new NumberFormat("#,##0.00", "id_ID");
    return formatCurrency.format(number);
  }

  static String idrFormat(double number) {
    final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
    return formatCurrency.format(number);
  }

  static String phoneNumberFormat(String number) {
    return number.startsWith("0")
        ? number.replaceFirst("0", "62")
        : "62$number";
  }
}

import 'package:mmksi_vts_mobile/app/misc/constants.dart';
import 'package:mmksi_vts_mobile/data/infrastructures/encrypter_interface.dart';
import 'package:mmksi_vts_mobile/domains/user_domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  // basic profile
  int? id;
  String? name,
      salesCode,
      phone,
      email,
      position,
      level,
      location,
      photo,
      salesmanPhone,
      salesmanEmail,
      change;

  // grade
  String? currentGrade, scoreCurrent, scorePrev, prevGrade;

  // employment info
  String? teamCategory, entryDate, supervisor;

  // dealer info
  String? dealerName,
      dealerCity,
      dealerBranch,
      dealerGroup,
      dealerCode,
      dealerArea;
  int? dealerGroupId;

  // token
  String? token;
  int? expiresAt;

  // misc
  bool? forceUpdate,
      forgotPassword,
      isRegistered,
      hasNotifications,
      hasSeenAppInfo,
      isNotFirstTime;
  String? password, logoutReason, fcmToken, goLive;
  int? lastUser;
  OpenedMenu? openedMenu = OpenedMenu(
    pdiIsOpen: false,
    spkTrackingIsOpen: false,
    pktIsOpen: false,
    warrantyIsOpen: false,
  );

  // analytic data
  int? dealerId;
  String? dealerBranchCode, jobPosition, city, platform;

  EncrypterInterface? _encrypter;

  int notificationCount = 0;

  bool get isSuperior =>
      position == 'Supervisor' ||
      position == 'Sales Manager' ||
      position == 'Branch Manager';

  UserData(this._encrypter) {
    this.loadData();
  }

  void fromUser(User user) {
    this.id = user.id;
    this.change = user.change;
    this.name = user.profile?.name;
    this.salesCode = user.profile?.salesCode;
    this.phone = user.profile?.phone;
    this.email = user.profile?.email;
    this.level = user.profile?.level;
    this.position = user.profile?.position;
    this.level = user.profile?.level;
    this.photo = user.profile?.photo;
    this.salesmanEmail = user.profile?.salesmanEmail;
    this.salesmanPhone = user.profile?.salesmanPhone;
    this.currentGrade = user.grade?.current;
    this.scoreCurrent = user.grade?.scoreCurrent;
    this.prevGrade = user.grade?.prev;
    this.scorePrev = user.grade?.scorePrev;
    this.teamCategory = user.team?.category;
    this.entryDate = user.team?.entryDate;
    this.supervisor = user.team?.supervisor;
    this.dealerName = user.dealer?.name;
    this.dealerCode = user.dealer?.code;
    this.dealerCity = user.dealer?.city;
    this.dealerBranch = user.dealer?.branch;
    this.dealerGroup = user.dealer?.group;
    this.dealerName = user.dealer?.name;
    this.dealerArea = user.dealer?.area;
    this.dealerGroupId = user.dealer?.dealerGroupId ?? 0;

    if (user.token != null) {
      this.token = user.token?.accessToken;
      this.expiresAt = user.token?.expiresAt;
    }
    this.forceUpdate = user.forceUpdate;
    this.isRegistered = user.isRegistered;
    this.dealerId = user.analytic?.dealerId;
    this.dealerBranchCode = user.analytic?.dealerBranchCode;
    this.city = user.analytic?.city;
    this.jobPosition = user.analytic?.jobPosition;
    this.goLive = user.goLive;
    this.openedMenu = user.openedMenu;
  }

  void fromToken(Token token) {
    this.token = token.accessToken;
    this.expiresAt = token.expiresAt;
  }

  void loadData({Function? callback}) {
    this._getSharedPreferences()?.then((sp) {
      // this.id = int.parse(_decryptValue(sp.getString(AppConstants.USER_DATA_ID),
      //     type: "integer"));
      var userDataId = sp.getString(AppConstants.USER_DATA_ID) ?? "";
      this.id = int.tryParse(_decryptValue(userDataId) ?? "");
      this.change = _decryptValue(sp.getString(AppConstants.USER_CHANGE));
      this.name = _decryptValue(sp.getString(AppConstants.USER_DATA_NAME));
      this.salesCode =
          _decryptValue(sp.getString(AppConstants.USER_DATA_SALES_CODE));
      this.phone = _decryptValue(sp.getString(AppConstants.USER_DATA_PHONE));
      this.email = _decryptValue(sp.getString(AppConstants.USER_DATA_EMAIL));
      this.position =
          _decryptValue(sp.getString(AppConstants.USER_DATA_POSITION));
      this.level = _decryptValue(sp.getString(AppConstants.USER_DATA_LEVEL));
      this.location =
          _decryptValue(sp.getString(AppConstants.USER_DATA_LOCATION));
      this.photo = _decryptValue(sp.getString(AppConstants.USER_DATA_PHOTO));
      this.salesmanEmail =
          _decryptValue(sp.getString(AppConstants.USER_DATA_SALESMAN_EMAIL));
      this.salesmanPhone =
          _decryptValue(sp.getString(AppConstants.USER_DATA_SALESMAN_PHONE));
      this.level = _decryptValue(sp.getString(AppConstants.USER_DATA_LEVEL));
      this.currentGrade =
          _decryptValue(sp.getString(AppConstants.USER_DATA_CURRENT_GRADE));
      this.scoreCurrent = _decryptValue(
          sp.getString(AppConstants.USER_DATA_SCORE_CURRENT_GRADE));
      this.prevGrade =
          _decryptValue(sp.getString(AppConstants.USER_DATA_PREV_GRADE));
      this.scorePrev =
          _decryptValue(sp.getString(AppConstants.USER_DATA_SCORE_PREV_GRADE));
      this.teamCategory =
          _decryptValue(sp.getString(AppConstants.USER_DATA_TEAM_CATEGORY));
      this.entryDate =
          _decryptValue(sp.getString(AppConstants.USER_DATA_ENTRY_DATE));
      this.supervisor =
          _decryptValue(sp.getString(AppConstants.USER_DATA_SUPERVISOR));
      this.dealerName =
          _decryptValue(sp.getString(AppConstants.USER_DATA_DEALER_NAME));
      this.dealerCode =
          _decryptValue(sp.getString(AppConstants.USER_DATA_DEALER_CODE));
      this.dealerCity =
          _decryptValue(sp.getString(AppConstants.USER_DATA_DEALER_CITY));
      this.dealerBranch =
          _decryptValue(sp.getString(AppConstants.USER_DATA_DEALER_BRANCH));
      this.dealerGroup =
          _decryptValue(sp.getString(AppConstants.USER_DATA_DEALER_GROUP));
      this.dealerName =
          _decryptValue(sp.getString(AppConstants.USER_DATA_DEALER_NAME));
      this.dealerArea =
          _decryptValue(sp.getString(AppConstants.USER_DATA_DEALER_AREA));
      var userDataDealerGroupId =
          sp.getString(AppConstants.USER_DATA_DEALER_GROUP_ID) ?? "";
      this.dealerGroupId =
          int.tryParse(_decryptValue(userDataDealerGroupId) ?? "");
      this.token = _decryptValue(sp.getString(AppConstants.USER_DATA_TOKEN));
      var userDataExpiresAt =
          sp.getString(AppConstants.USER_DATA_EXPIRES_AT) ?? "";
      this.expiresAt = int.tryParse(_decryptValue(userDataExpiresAt) ?? "");

      this.hasNotifications =
          sp.getBool(AppConstants.USER_DATA_HAS_NOTIFICATIONS) ?? false;
      this.forgotPassword =
          sp.getBool(AppConstants.USER_DATA_FORGOT_PASSWORD) ?? false;
      this.isNotFirstTime =
          sp.getBool(AppConstants.USER_DATA_IS_FIRST_TIME) ?? false;
      this.logoutReason = sp.getString(AppConstants.USER_DATA_LOGOUT_REASON);

      var userDataLatUser =
          sp.getString(AppConstants.USER_DATA_EXPIRES_AT) ?? "";
      this.lastUser = int.tryParse(_decryptValue(userDataLatUser) ?? "");

      this.isRegistered =
          sp.getBool(AppConstants.USER_DATA_IS_REGISTERED) ?? false;
      this.goLive =
          _decryptValue(sp.getString(AppConstants.USER_DATA_GO_LIVE_DATE));
      this.forceUpdate =
          sp.getBool(AppConstants.USER_DATA_IS_REGISTERED) ?? false;
      this.openedMenu?.pdiIsOpen =
          sp.getBool(AppConstants.USER_DATA_IS_PDI_OPEN) ?? true;
      this.openedMenu?.pktIsOpen =
          sp.getBool(AppConstants.USER_DATA_IS_PKT_OPEN) ?? true;
      this.openedMenu?.warrantyIsOpen =
          sp.getBool(AppConstants.USER_DATA_IS_WA_OPEN) ?? true;
      this.openedMenu?.spkTrackingIsOpen =
          sp.getBool(AppConstants.USER_DATA_IS_SPK_OPEN) ?? true;

      this.hasSeenAppInfo =
          sp.getBool(AppConstants.USER_DATA_APP_INFO) ?? false;
      this.fcmToken =
          _decryptValue(sp.getString(AppConstants.USER_DATA_FCM_TOKEN));
      this.password =
          _decryptValue(sp.getString(AppConstants.USER_DATA_PASSWORD));

      var userDataAnalyticDealer =
          sp.getString(AppConstants.USER_DATA_ANALYTIC_DEALER) ?? "";
      this.lastUser = int.tryParse(_decryptValue(userDataAnalyticDealer) ?? "");

      this.dealerBranchCode =
          _decryptValue(sp.getString(AppConstants.USER_DATA_ANALYTIC_BRANCH));
      this.jobPosition =
          _decryptValue(sp.getString(AppConstants.USER_DATA_ANALYTIC_POSITION));
      this.city =
          _decryptValue(sp.getString(AppConstants.USER_DATA_ANALYTIC_CITY));
      this.platform =
          _decryptValue(sp.getString(AppConstants.USER_DATA_ANALYTIC_PLATFORM));
      var userDataDealerid =
          _decryptValue(sp.getString(AppConstants.USER_DATA_ANALYTIC_DEALER));
      this.dealerId = int.tryParse(userDataDealerid ?? "0") ?? 0;

      var notificationCount = _decryptValue(
          sp.getString(AppConstants.USER_DATA_NOTIFICATION_COUNT));
      this.notificationCount = int.tryParse(notificationCount ?? "0") ?? 0;

      callback?.call();
    });
  }

  void clear() {
    this._getSharedPreferences()?.then((sp) {
      this.clearProperties();
      sp.clear();
    });
  }

  void clearWithCallback(Function callback) {
    this._getSharedPreferences()?.then((sp) {
      sp.clear().then((onValue) {
        this.clearProperties();
        callback();
      });
    });
  }

  void clearProperties() {
    this.id = null;
    this.change = null;
    this.forgotPassword = null;
    this.name = null;
    this.salesCode = null;
    this.phone = null;
    this.email = null;
    this.position = null;
    this.level = null;
    this.location = null;
    this.photo = null;
    this.salesmanPhone = null;
    this.salesmanEmail = null;
    this.level = null;
    this.currentGrade = null;
    this.prevGrade = null;
    this.teamCategory = null;
    this.entryDate = null;
    this.supervisor = null;
    this.dealerName = null;
    this.dealerCode = null;
    this.dealerCity = null;
    this.dealerBranch = null;
    this.dealerGroup = null;
    this.dealerName = null;
    this.dealerArea = null;
    this.dealerGroupId = null;
    this.token = null;
    this.expiresAt = null;
    this.hasNotifications = null;
    this.logoutReason = null;
    this.lastUser = null;
    this.isRegistered = null;
    this.forceUpdate = null;
    this.fcmToken = null;
    this.goLive = null;
    this.openedMenu?.pdiIsOpen = null;
    this.openedMenu?.pktIsOpen = null;
    this.openedMenu?.warrantyIsOpen = null;
    this.openedMenu?.spkTrackingIsOpen = null;
    this.password = null;

    this.dealerId = null;
    this.dealerBranchCode = null;
    this.jobPosition = null;
    this.city = null;
    this.platform = null;
  }

  Future<void>? save() {
    return this._getSharedPreferences()?.then((sp) {
      sp.setString(AppConstants.USER_DATA_ID, _encryptValue(this.id) ?? "");
      sp.setString(AppConstants.USER_CHANGE, _encryptValue(this.change) ?? "");
      sp.setString(AppConstants.USER_DATA_NAME, _encryptValue(this.name) ?? "");
      sp.setString(AppConstants.USER_DATA_SALES_CODE,
          _encryptValue(this.salesCode) ?? "");
      sp.setString(
          AppConstants.USER_DATA_PHONE, _encryptValue(this.phone) ?? "");
      sp.setString(
          AppConstants.USER_DATA_EMAIL, _encryptValue(this.email) ?? "");
      sp.setString(
          AppConstants.USER_DATA_POSITION, _encryptValue(this.position) ?? "");
      sp.setString(
          AppConstants.USER_DATA_LEVEL, _encryptValue(this.level) ?? "");
      sp.setString(
          AppConstants.USER_DATA_LOCATION, _encryptValue(this.location) ?? "");
      sp.setString(
          AppConstants.USER_DATA_PHOTO, _encryptValue(this.photo) ?? "");
      sp.setString(AppConstants.USER_DATA_SALESMAN_EMAIL,
          _encryptValue(this.salesmanEmail) ?? "");
      sp.setString(AppConstants.USER_DATA_SALESMAN_PHONE,
          _encryptValue(this.salesmanPhone) ?? "");
      sp.setString(
          AppConstants.USER_DATA_LEVEL, _encryptValue(this.level) ?? "");
      sp.setBool(
          AppConstants.USER_DATA_FORGOT_PASSWORD, this.forgotPassword ?? false);
      sp.setString(AppConstants.USER_DATA_CURRENT_GRADE,
          _encryptValue(this.currentGrade) ?? "");
      sp.setString(AppConstants.USER_DATA_PREV_GRADE,
          _encryptValue(this.prevGrade) ?? "");
      sp.setString(AppConstants.USER_DATA_SCORE_CURRENT_GRADE,
          _encryptValue(this.scoreCurrent) ?? "");
      sp.setString(AppConstants.USER_DATA_SCORE_PREV_GRADE,
          _encryptValue(this.scorePrev) ?? "");
      sp.setString(AppConstants.USER_DATA_TEAM_CATEGORY,
          _encryptValue(this.teamCategory) ?? "");
      sp.setString(AppConstants.USER_DATA_ENTRY_DATE,
          _encryptValue(this.entryDate) ?? "");
      sp.setString(AppConstants.USER_DATA_SUPERVISOR,
          _encryptValue(this.supervisor) ?? "");
      sp.setString(AppConstants.USER_DATA_DEALER_NAME,
          _encryptValue(this.dealerName) ?? "");
      sp.setString(AppConstants.USER_DATA_DEALER_CODE,
          _encryptValue(this.dealerCode) ?? "");
      sp.setString(AppConstants.USER_DATA_DEALER_CITY,
          _encryptValue(this.dealerCity) ?? "");
      sp.setString(AppConstants.USER_DATA_DEALER_BRANCH,
          _encryptValue(this.dealerBranch) ?? "");
      sp.setString(AppConstants.USER_DATA_DEALER_GROUP,
          _encryptValue(this.dealerGroup) ?? "");
      sp.setString(AppConstants.USER_DATA_DEALER_NAME,
          _encryptValue(this.dealerName) ?? "");
      sp.setString(AppConstants.USER_DATA_DEALER_AREA,
          _encryptValue(this.dealerArea) ?? "");
      sp.setString(AppConstants.USER_DATA_DEALER_GROUP_ID,
          _encryptValue(this.dealerGroupId.toString()) ?? "");
      sp.setString(
          AppConstants.USER_DATA_TOKEN, _encryptValue(this.token) ?? "");
      sp.setString(AppConstants.USER_DATA_EXPIRES_AT,
          _encryptValue(this.expiresAt) ?? "");
      sp.setBool(AppConstants.USER_DATA_HAS_NOTIFICATIONS,
          this.hasNotifications ?? false);
      sp.setBool(
          AppConstants.USER_DATA_IS_FIRST_TIME, this.isNotFirstTime ?? false);
      sp.setString(AppConstants.USER_DATA_LOGOUT_REASON,
          _encryptValue(this.logoutReason) ?? "");
      sp.setString(
          AppConstants.USER_DATA_LAST_USER, _encryptValue(this.lastUser) ?? "");
      sp.setBool(
          AppConstants.USER_DATA_IS_REGISTERED, this.isRegistered ?? false);
      sp.setBool(
          AppConstants.USER_DATA_FORCE_UPDATE, this.forceUpdate ?? false);
      sp.setBool(AppConstants.USER_DATA_APP_INFO, this.hasSeenAppInfo ?? false);
      sp.setString(
          AppConstants.USER_DATA_FCM_TOKEN, _encryptValue(this.fcmToken) ?? "");
      sp.setString(AppConstants.USER_DATA_GO_LIVE_DATE,
          _encryptValue(this.goLive) ?? "");
      sp.setString(
          AppConstants.USER_DATA_PASSWORD, _encryptValue(this.password) ?? "");
      sp.setString(AppConstants.USER_DATA_ANALYTIC_DEALER,
          _encryptValue(this.dealerId) ?? "");
      sp.setString(AppConstants.USER_DATA_ANALYTIC_BRANCH,
          _encryptValue(this.dealerBranchCode) ?? "");
      sp.setString(AppConstants.USER_DATA_ANALYTIC_POSITION,
          _encryptValue(this.jobPosition) ?? "");
      sp.setString(
          AppConstants.USER_DATA_ANALYTIC_CITY, _encryptValue(this.city) ?? "");
      sp.setString(AppConstants.USER_DATA_ANALYTIC_PLATFORM,
          _encryptValue(this.platform) ?? "");

      sp.setBool(AppConstants.USER_DATA_IS_PDI_OPEN,
          this.openedMenu?.pdiIsOpen ?? false);
      sp.setBool(AppConstants.USER_DATA_IS_PKT_OPEN,
          this.openedMenu?.pktIsOpen ?? false);
      sp.setBool(AppConstants.USER_DATA_IS_WA_OPEN,
          this.openedMenu?.warrantyIsOpen ?? false);
      sp.setBool(AppConstants.USER_DATA_IS_SPK_OPEN,
          this.openedMenu?.spkTrackingIsOpen ?? false);

      sp.setString(AppConstants.USER_DATA_NOTIFICATION_COUNT,
          _encryptValue(this.notificationCount) ?? "");
    });
  }

  String? _encryptValue(Object? value) {
    return _encrypter?.encrypt("$value");
  }

  String? _decryptValue(Object? value, {type: String}) {
    var result = _encrypter?.decrypt("$value");
    if (type == "integer" && (result == null || result == "null")) {
      result = "0";
    }

    if (result == "null") {
      result = null;
    }

    return result;
  }

  bool forcedLogout() {
    return this.logoutReason == "privacy" && this.lastUser == this.id;
  }

  Future<SharedPreferences>? _getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class AppConstants {
  // Primary Color reference https://www.schemecolor.com/mitsubishi-logo-red.php
  static const Color COLOR_PRIMARY_COLOR = Color.fromRGBO(202, 1, 17, 1.0);
  static const Color COLOR_WEAK_RED = Color.fromRGBO(227, 66, 77, 1.0);
  static const Color COLOR_PRIMARY_BACKGROUND =
      Color.fromRGBO(229, 229, 229, 1.0);
  static const Color COLOR_PROFILE_BACKGROUND = Color.fromRGBO(66, 66, 66, 1.0);
  static const Color COLOR_BACKGROUND_FOCUSED =
      Color.fromRGBO(213, 212, 212, 1.0);
  static const Color COLOR_DISABLED_BUTTON = Color.fromRGBO(200, 200, 200, 1.0);
  static const Color COLOR_DISABLED_TEXT = Color.fromRGBO(151, 151, 151, 1.0);
  static const Color COLOR_NOTIFICATION_READ =
      Color.fromRGBO(250, 226, 228, 1.0);
  static const Color COLOR_BOTTOM_SHEET_SECTION =
      Color.fromRGBO(139, 139, 139, 1);
  static const Color COLOR_CHECKBOX_BORDER = Color.fromRGBO(215, 215, 215, 1);
  static const Color COLOR_POP_UP_MENU_TEXT = Color.fromRGBO(70, 78, 95, 1);
  static const Color COLOR_CANCELLED_TEXT = Color.fromRGBO(31, 31, 31, 1);
  static const Color COLOR_BLACKED_TEXT = Color.fromRGBO(0, 0, 0, 1);
  static const Color COLOR_BLACKED_TEXT_TRANSPARENT =
      Color.fromRGBO(0, 0, 0, 0.48);
  static const Color COLOR_GREYED_TEXT = Color.fromRGBO(147, 147, 147, 1.0);
  static const Color COLOR_GREYED_BORDER = Color.fromRGBO(151, 151, 151, 1);
  static const Color COLOR_GREYED_TEXT_TRANSPARANT =
      Color.fromRGBO(147, 147, 147, 0.5);
  static const Color COLOR_CONTACT_TITLE = Color.fromRGBO(95, 70, 90, 1);
  static const Color COLOR_CONTACT_SUBTITLE = Color.fromRGBO(151, 151, 151, 1);
  static const Color COLORED_GREYED_TEXT_TRANSPARANT =
      Color.fromRGBO(147, 147, 147, 0.25);
  static const Color COLOR_SUCCESS = Color.fromRGBO(1, 193, 124, 1.0);
  static const Color COLOR_ERROR = Color.fromRGBO(218, 0, 39, 1.0);
  static const Color COLOR_RED_NOTICE = Color.fromRGBO(255, 50, 50, 1.0);
  static const Color COLOR_RED_TEXT = Color.fromRGBO(202, 0, 14, 1);
  static const Color COLOR_BLACK = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color COLOR_WHITE = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color COLOR_RED = Color.fromRGBO(255, 0, 0, 1.0);
  static const Color COLOR_PROFILE = Color(0xff333333);
  static const Color COLOR_PROFILE_SILVER = Color.fromRGBO(180, 180, 180, 1.0);
  static const Color COLOR_PROFILE_REGULER = Color(0xffAD8A56);
  static const Color COLOR_PROFILE_GOLD = Color.fromRGBO(239, 206, 74, 1.0);
  static const Color COLOR_GREY = Color(0xffF3F3F3);
  static const Color COLOR_DARK_GREY = Color.fromRGBO(54, 54, 54, 1);
  static const Color COLOR_QUANTITY_BOX = Color.fromRGBO(250, 251, 252, 1);

  // user data
  static const String USER_DATA_ID = "id";
  static const String USER_CHANGE = "change";
  static const String USER_DATA_NAME = "name";
  static const String USER_DATA_SALES_CODE = "sales_code";
  static const String USER_DATA_PHONE = "phone";
  static const String USER_DATA_EMAIL = "email";
  static const String USER_DATA_LEVEL = "level";
  static const String USER_DATA_POSITION = "position";
  static const String USER_DATA_LOCATION = "location";
  static const String USER_DATA_PHOTO = "photo";
  static const String USER_DATA_CURRENT_GRADE = "current_grade";
  static const String USER_DATA_PREV_GRADE = "prev_grade";
  static const String USER_DATA_SCORE_CURRENT_GRADE = "score_current_grade";
  static const String USER_DATA_SCORE_PREV_GRADE = "score_prev_grade";
  static const String USER_DATA_TEAM_CATEGORY = "team_category";
  static const String USER_DATA_ENTRY_DATE = "entry_date";
  static const String USER_DATA_SUPERVISOR = "supervisor";
  static const String USER_DATA_DEALER_NAME = "dealer_name";
  static const String USER_DATA_DEALER_AREA = "dealer_area";
  static const String USER_DATA_DEALER_GROUP_ID = "dealer_group_id";
  static const String USER_DATA_DEALER_CITY = "dealer_city";
  static const String USER_DATA_DEALER_BRANCH = "dealer_branch";
  static const String USER_DATA_DEALER_GROUP = "dealer_group";
  static const String USER_DATA_DEALER_CODE = "dealer_code";
  static const String USER_DATA_TOKEN = "token";
  static const String USER_DATA_EXPIRES_AT = "expires_at";
  static const String USER_DATA_FORGOT_PASSWORD = "forgot_password";
  static const String USER_DATA_HAS_NOTIFICATIONS = "has_notifications";
  static const String USER_DATA_IS_FIRST_TIME = "is_first_time";
  static const String USER_DATA_LOGOUT_REASON = "logout_reason";
  static const String USER_DATA_LAST_USER = "last_user";
  static const String USER_DATA_IS_REGISTERED = "is_registered";
  static const String USER_DATA_GO_LIVE_DATE = "go_live_date";
  static const String USER_DATA_FORCE_UPDATE = "force_update";
  static const String USER_DATA_APP_INFO = "app_info";
  static const String USER_DATA_FCM_TOKEN = "fcm_token";
  static const String USER_DATA_PASSWORD = "password";
  static const String USER_DATA_SALESMAN_EMAIL = "salesman_email";
  static const String USER_DATA_SALESMAN_PHONE = "salesman_phone";

  static const String USER_DATA_NOTIFICATION_COUNT = "notification_count";

  //opened Menu
  static const String USER_DATA_IS_PDI_OPEN = "is_pdi_open";
  static const String USER_DATA_IS_PKT_OPEN = "is_pkt_open";
  static const String USER_DATA_IS_WA_OPEN = "is_wa_open";
  static const String USER_DATA_IS_SPK_OPEN = "is_spk_open";

  static const String USER_DATA_ANALYTIC_DEALER = "dealer_id";
  static const String USER_DATA_ANALYTIC_BRANCH = "branch_id";
  static const String USER_DATA_ANALYTIC_POSITION = "position_id";
  static const String USER_DATA_ANALYTIC_CITY = "city_id";
  static const String USER_DATA_ANALYTIC_PLATFORM = "platform";

  // image data
  static const String IMAGE_DATA_BARCODE = "image_barcode";
  static const String IMAGE_DATA_SALESMAN_CUSTOMER = "image_salesman_customer";
  static const String IMAGE_DATA_SERVICE_BOOK = "image_service_book";
  static const String IMAGE_DATA_MY_MITSUBISHI = "image_my_mitsubishi";

  // notifications
  static const String NOTIFICATION_CHANNEL_ID = "sfid_mobile_announcement";
  static const String NOTIFICATION_CHANNEL_NAME = "SFID Mobile";
  static const String NOTIFICATION_CHANNEL_DESCRIPTION =
      "SFID Mobile Notification Channel";
  static const String NEW_NOTIFICATION = "new_notification";
  static const String NEW_MATERIAL = "new_material";

  static const String URL_CATALOG =
      "https://www.mitsubishi-motors.co.id/brosur";
  static const String URL_ELEARNING = "https://ktb.docebosaas.com/learn";
  static const String OFFICEVIEW =
      "https://view.officeapps.live.com/op/view.aspx?src=";
  static const String GOOGLEVIEW =
      "https://docs.google.com/gview?embedded=true&url=";

  // master_data
  static const String MASTER_DATA_GENDER = "master_data_gender";
  static const String MASTER_DATA_LEAD_SOURCE = "master_data_eadSource";
  static const String MASTER_DATA_PHONE_TYPE = "master_data_phoneType";
  static const String MASTER_DATA_CUSTOMER_TYPE = "master_data_customer_type";
  static const String MASTER_DATA_PROVINCE = "master_data_provincies";
  static const String MASTER_DATA_PREAREA = "master_data_prearea";
  static const String MASTER_DATA_IDENTITY_TYPE = "master_data_identity_type";
  static const String MASTER_DATA_CUSTOMER_SUB_CLASS =
      "master_data_customer_sub_class";
  static const String MASTER_DATA_PRINT_REGION = "master_data_print_region";
  static const String MASTER_DATA_INTERFACE_CUSTOMER_SALES =
      "master_data_interface_customer_sales";
  static const String MASTER_DATA_INTERFACE_STATUS =
      "master_data_interface_status";
  static const String MASTER_DATA_SEX = "master_data_sex";
  static const String MASTER_DATA_LEAD_STATUS = "master_data_lead_status";
  static const String MASTER_DATA_CURRENT_BRAND = "master_data_current_brand";
  static const String MASTER_DATA_CUSTOMER_PURPOSE =
      "master_data_customer_purpose";
  static const String MASTER_DATA_SAP_CUSTOMER_STATUS =
      "master_data_sap_customer_status";
  static const String MASTER_DATA_VEHICLE_MODEL = "master_data_vehicle_model";
  static const String MASTER_DATA_PROFILE_GROUP = "master_data_profile_group";
  static const String MASTER_DATA_APPOINTMENT_TYPE =
      "master_data_appointment_type";
  static const String MASTER_DATA_SHOW_TIME = "master_data_show_time";
  static const String MASTER_DATA_RESULT_ACTIVITY =
      "master_data_result_activity";
  static const String MASTER_DATA_STATUS_ACTIVITY =
      "master_data_status_activity";
  static const String MASTER_DATA_RATING = "master_data_rating";
  static const String MASTER_DATA_CALL_PURPOSE = "master_data_call_purpose";
  static const String MASTER_DATA_REASON = "master_data_reason";
  static const String MASTER_DATA_LEAD_STATUS_ACTIVITY =
      "master_data_lead_status_activity";
  static const String MASTER_DATA_MESSAGE_TYPE = "master_data_message_type";
  static const String MASTER_DATA_CALLING_TYPE = "master_data_calling_type";
  static const String MASTER_DATA_COUNTRY_CODE = "master_data_country_code";
  static const String MASTER_DATA_OCR_TOKEN = "OCR_TOKEN";

  // assets
  static const String ASSET_ICON_PATH = "lib/app/ui/assets/icons";
  static const String ASSET_IMAGE_PATH = "lib/app/ui/assets/images";

  // Text Size
  static const TEXT_SIZE_36 = 36.0;
  static const TEXT_SIZE_24 = 24.0;
  static const TEXT_SIZE_20 = 20.0;
  static const TEXT_SIZE_18 = 18.0;
  static const TEXT_SIZE_16 = 16.0;
  static const TEXT_SIZE_14 = 14.0;
  static const TEXT_SIZE_13 = 13.0;
  static const TEXT_SIZE_12 = 12.0;
  static const TEXT_SIZE_10 = 10.0;
  static const TEXT_SIZE_8 = 8.0;

  // Dimen Size
  static const DIMEN_SIZE_8 = 8.0;
  static const DIMEN_SIZE_10 = 10.0;
  static const DIMEN_SIZE_12 = 12.0;
  static const DIMEN_SIZE_16 = 16.0;
  static const DIMEN_SIZE_20 = 20.0;
  static const DIMEN_SIZE_24 = 24.0;

  static const FONT_WEIGHT_NORMAL = FontWeight.normal;
  static const FONT_WEIGHT_BOLD = FontWeight.bold;
  static const FONT_WEIGHT_400 = FontWeight.w400;
  static const FONT_WEIGHT_500 = FontWeight.w500;
  static const FONT_WEIGHT_600 = FontWeight.w600;
  static const FONT_WEIGHT_700 = FontWeight.w700;
  static const FONT_WEIGHT_800 = FontWeight.w800;
}

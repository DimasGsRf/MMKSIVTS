import 'package:flutter/material.dart';
import 'package:mmksi_vts_mobile/app/misc/constants.dart';
import 'package:mmksi_vts_mobile/app/ui/res/generated/i18n.dart';
import 'package:mmksi_vts_mobile/app/ui/widgets/network_image_cache.dart';

class CustomDialog {
  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  static Dialog imageDialog(
          {@required BuildContext? context,
          double boxHeight = 300.0,
          double boxWidth = 300.0,
          String? image,
          VoidCallback? onConfirm}) =>
      Dialog(
        shape: CircleBorder(),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: image == null
                  ? ExactAssetImage(
                      'lib/app/ui/assets/images/black-logo-wIth-slogan-high.png')
                  : NetworkImageCache(image) as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
          width: boxWidth,
          height: boxHeight,
        ),
      );

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  static AlertDialog confirmDialog({
    required BuildContext context,
    String? title,
    String? content,
    FontWeight onConfirmTextFontWeight = FontWeight.normal,
    String? onCancelText = 'Batalkan',
    String? onConfirmText = 'Hapus',
    Color onCancelTextColor = AppConstants.COLOR_PRIMARY_COLOR,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) =>
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0)), //this right here
        title: title == null
            ? null
            : Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        content: SelectableText(content ?? '',
            style: TextStyle(letterSpacing: -0.5)),
        actions: <Widget>[
          TextButton(
            onPressed: onCancel == null
                ? () {
                    Navigator.pop(context);
                  }
                : onCancel,
            child: Text(onCancelText ?? "Batalkan",
                style: TextStyle(color: onCancelTextColor)),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(onConfirmText ?? "Hapus",
                style: TextStyle(
                  color: AppConstants.COLOR_PRIMARY_COLOR,
                  fontWeight: onConfirmTextFontWeight,
                )),
          )
        ],
      );

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  static AlertDialog successDialog(
          {@required BuildContext? context,
          @required String? title,
          Widget? content,
          String onConfirmText = 'Kembali',
          VoidCallback? onConfirm}) =>
      AlertDialog(
        titlePadding: EdgeInsets.all(0),
        title: Container(
            color: AppConstants.COLOR_SUCCESS,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  color: AppConstants.COLOR_WHITE,
                  size: 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                Text(
                  title ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppConstants.COLOR_WHITE),
                ),
              ],
            )),
        content: content,
        actions: <Widget>[
          TextButton(
            onPressed: onConfirm,
            child: Text(onConfirmText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppConstants.COLOR_BLACK,
                    fontSize: 18)),
          )
        ],
      );

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  static AlertDialog errorDialog(
          {@required BuildContext? context,
          @required String? title,
          Widget icon = const RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Icon(
              Icons.add_circle,
              color: AppConstants.COLOR_WHITE,
              size: 24,
            ),
          ),
          String? content,
          String onConfirmText = 'Oke',
          VoidCallback? onConfirm}) =>
      AlertDialog(
        titlePadding: EdgeInsets.all(0),
        title: Container(
            color: AppConstants.COLOR_ERROR,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                icon,
                Container(
                  width: 10,
                ),
                Text(
                  title ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppConstants.COLOR_WHITE),
                ),
              ],
            )),
        content: Text(content ?? ""),
        actions: <Widget>[
          TextButton(
            onPressed: onConfirm,
            child: Text(onConfirmText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppConstants.COLOR_BLACK,
                    fontSize: 18)),
          )
        ],
      );

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  static AlertDialog customErrorDialog(
          {@required BuildContext? context,
          @required String? title,
          Widget icon = const RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Icon(
              Icons.add_circle,
              color: AppConstants.COLOR_WHITE,
              size: 24,
            ),
          ),
          Widget? content,
          String onConfirmText = 'Oke',
          VoidCallback? onConfirm}) =>
      AlertDialog(
        titlePadding: EdgeInsets.all(0),
        title: Container(
            color: AppConstants.COLOR_ERROR,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                icon,
                Container(
                  width: 10,
                ),
                Text(
                  title ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppConstants.COLOR_WHITE),
                ),
              ],
            )),
        content: content,
        actions: <Widget>[
          TextButton(
            onPressed: onConfirm,
            child: Text(onConfirmText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppConstants.COLOR_BLACK,
                    fontSize: 18)),
          )
        ],
      );

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  static Dialog plainDialog({
    @required BuildContext? context,
    String? title,
    @required VoidCallback? onClose,
    String? name,
    double boxHeight = 400.0,
    double boxWidth = 350.0,
    double l = 20,
    Widget? body,
    TextStyle? style,
    bool defaultBackButton = false,
    VoidCallback? onConfirm,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: boxWidth,
        height: boxHeight,
        constraints: BoxConstraints(
          maxHeight: 500,
          minWidth: 300,
          maxWidth: 350,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              constraints: BoxConstraints(maxHeight: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  name == null ? title ?? "" : name,
                  textAlign: TextAlign.center,
                  style: style == null
                      ? TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                      : style,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.fromLTRB(l, 87, 20, 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: body,
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    if (defaultBackButton)
                      TextButton(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            TextStyle(color: AppConstants.COLOR_PRIMARY_COLOR),
                          ),
                        ),
                        onPressed: onClose,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            context != null ? S.of(context).label_back : '',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (defaultBackButton == true)
              Align(
                // These values are based on trial & error method
                alignment: Alignment(1.05, -1.05),
                child: InkWell(
                  onTap: onClose,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  static AlertDialog infoDialog({
    @required BuildContext? context,
    @required String? title,
    String onConfirmText = 'Kembali',
    VoidCallback? onConfirm,
  }) =>
      AlertDialog(
        titlePadding: EdgeInsets.all(0),
        title: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: <Widget>[
              Text(
                title ?? "",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.COLOR_BLACK),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onConfirm,
            child: Text(
              onConfirmText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstants.COLOR_BLACK,
                fontSize: 18,
              ),
            ),
          )
        ],
      );

  static AlertDialog successDialogRounded({
    @required BuildContext? context,
    @required String? title,
    Widget? content,
    String onConfirmText = 'Kembali',
    VoidCallback? onConfirm,
  }) =>
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        titlePadding: EdgeInsets.all(0),
        title: Container(
          decoration: BoxDecoration(
            color: AppConstants.COLOR_SUCCESS,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                color: AppConstants.COLOR_WHITE,
                size: 32,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Text(
                title ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppConstants.COLOR_WHITE,
                ),
              ),
            ],
          ),
        ),
        content: content,
        actions: <Widget>[
          TextButton(
            onPressed: onConfirm,
            child: Text(
              onConfirmText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstants.COLOR_BLACK,
                fontSize: 18,
              ),
            ),
          )
        ],
      );

  static AlertDialog confirmDialogRounded({
    @required BuildContext? context,
    String? title,
    String? content,
    FontWeight onConfirmTextFontWeight = FontWeight.normal,
    String onCancelText = 'Batalkan',
    String onConfirmText = 'Hapus',
    Color onCancelTextColor = AppConstants.COLOR_PRIMARY_COLOR,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) =>
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ), //this right here
        title: title == null
            ? null
            : Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        content: Text(content ?? "", style: TextStyle(letterSpacing: -0.5)),
        actions: <Widget>[
          TextButton(
            onPressed: onCancel,
            child: Text(
              onCancelText,
              style: TextStyle(color: onCancelTextColor),
            ),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(
              onConfirmText,
              style: TextStyle(
                color: AppConstants.COLOR_PRIMARY_COLOR,
                fontWeight: onConfirmTextFontWeight,
              ),
            ),
          )
        ],
      );

  static AlertDialog errorDialogRounded({
    @required BuildContext? context,
    @required String? title,
    Widget icon = const RotationTransition(
      turns: AlwaysStoppedAnimation(45 / 360),
      child: Icon(
        Icons.add_circle,
        color: AppConstants.COLOR_WHITE,
        size: 24,
      ),
    ),
    String? content,
    String? onConfirmText = 'Oke',
    VoidCallback? onConfirm,
  }) =>
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        titlePadding: EdgeInsets.all(0),
        title: Container(
          decoration: BoxDecoration(
            color: AppConstants.COLOR_ERROR,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              icon,
              SizedBox(width: 10),
              Text(
                title ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppConstants.COLOR_WHITE,
                ),
              ),
            ],
          ),
        ),
        content: Text(content ?? ""),
        actions: <Widget>[
          TextButton(
            onPressed: onConfirm,
            child: Text(
              onConfirmText ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstants.COLOR_BLACK,
                fontSize: 18,
              ),
            ),
          )
        ],
      );
}

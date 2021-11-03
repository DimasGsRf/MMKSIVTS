import 'package:flutter/material.dart';
import 'package:sfid_mobile/app/misc/constants.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final dynamic buttonText;
  final Color buttonTextColor;
  final Color buttonColor;
  final bool isDisabled, isAutoFocus;
  final double minWidth, height, fontSize, borderRadius;
  final FontWeight buttonTextWeight;
  final Color borderColor;
  final EdgeInsetsGeometry outerPadding;
  final double? elevation;

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  const CommonButton(
      {Key? key,
      this.onPressed,
      @required this.buttonText,
      this.borderColor = Colors.transparent,
      this.isDisabled = false,
      this.isAutoFocus = false,
      this.minWidth = 88.0,
      this.height = 36.0,
      this.borderRadius = 7.0,
      this.outerPadding = const EdgeInsets.fromLTRB(32.0, 2.0, 32.0, 2.0),
      this.fontSize = 14.0,
      this.buttonColor = AppConstants.COLOR_PRIMARY_COLOR,
      this.buttonTextColor = AppConstants.COLOR_WHITE,
      this.elevation,
      this.buttonTextWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
      padding: outerPadding,
      child: Container(
        width: minWidth,
        height: height,
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(elevation),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10),
                  side: BorderSide(color: borderColor),
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return AppConstants.COLOR_DISABLED_BUTTON.withOpacity(0.7);
                } else {
                  return buttonColor;
                }
              }),
              textStyle:
                  MaterialStateProperty.all(TextStyle(color: buttonTextColor))),
          autofocus: isAutoFocus,
          onPressed: isDisabled ? null : onPressed,
          child: buttonText is String
              ? Text(buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: buttonTextColor,
                      fontWeight: buttonTextWeight,
                      fontFamily: 'MMC'))
              : buttonText,
        ),
      ),
    );
  }
}

/// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
/// Pastikan tidak merusak tampilan yang lainnya
/// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
/// =====================================================
///
class CommonButtonNoPadding extends StatelessWidget {
  final VoidCallback? onPressed;
  final dynamic buttonText;
  final Color buttonTextColor;
  final Color buttonColor;
  final bool isDisabled, isAutoFocus;
  final double minWidth, height, fontSize;
  final FontWeight buttonTextWeight;
  final Color borderColor;

  const CommonButtonNoPadding(
      {Key? key,
      this.onPressed,
      @required this.buttonText,
      this.borderColor = Colors.transparent,
      this.isDisabled = false,
      this.isAutoFocus = false,
      this.minWidth = 88.0,
      this.height = 36.0,
      this.fontSize = 14.0,
      this.buttonColor = AppConstants.COLOR_PRIMARY_COLOR,
      this.buttonTextColor = AppConstants.COLOR_WHITE,
      this.buttonTextWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
      padding: EdgeInsets.only(),
      child: Container(
        width: minWidth,
        height: height,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(7.0),
                  side: BorderSide(color: borderColor),
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return AppConstants.COLOR_DISABLED_BUTTON;
                } else {
                  return buttonColor;
                }
              }),
              textStyle:
                  MaterialStateProperty.all(TextStyle(color: buttonTextColor))),
          autofocus: isAutoFocus,
          onPressed: isDisabled ? null : onPressed,
          child: buttonText is String
              ? Text(buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: buttonTextColor,
                      fontWeight: buttonTextWeight,
                      fontFamily: 'MMC'))
              : buttonText,
        ),
      ),
    );
  }
}

class CommonButtonWithoutWidth extends StatelessWidget {
  final VoidCallback? onPressed;
  final dynamic buttonText;
  final Color? buttonTextColor;
  final Color? buttonColor;
  final FontWeight? buttonFontWeight;
  final Color? borderColor;
  final double? buttonFontSize, height;

  const CommonButtonWithoutWidth(
      {Key? key,
      this.onPressed,
      @required this.buttonText,
      this.borderColor,
      this.buttonFontSize,
      this.buttonColor,
      this.buttonTextColor,
      this.buttonFontWeight,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
          ),
          primary: buttonColor ?? AppConstants.COLOR_PRIMARY_COLOR,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              buttonText,
              style: TextStyle(
                fontFamily: "MMC",
                color: buttonTextColor ?? AppConstants.COLOR_WHITE,
                fontWeight: buttonFontWeight ?? AppConstants.FONT_WEIGHT_500,
                fontSize: buttonFontSize ?? AppConstants.TEXT_SIZE_14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

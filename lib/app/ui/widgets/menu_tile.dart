import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfid_mobile/app/misc/constants.dart';

class CommonMenuTile extends StatelessWidget {
  final TextStyle? textStyle;
  final String? leftText;
  final dynamic subInfo;
  final bool selected,
      enabled,
      dense,
      showArrow,
      headerOnly,
      switchToggle,
      switchValue;
  final VoidCallback? _onLongPress, _onPress;
  final EdgeInsetsGeometry padding;
  final Function(bool)? _switchCallback;

  // HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  // Pastikan tidak merusak tampilan yang lainnya
  // Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  const CommonMenuTile({
    Key? key,
    VoidCallback? onLongPress,
    onPress,
    Function(bool)? switchCallback,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    @required this.leftText,
    this.subInfo,
    this.showArrow = true,
    this.dense = true,
    this.selected = false,
    this.enabled = true,
    this.headerOnly = false,
    this.switchToggle = false,
    this.switchValue = true,
  })  : _onLongPress = onLongPress,
        _onPress = onPress,
        _switchCallback = switchCallback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return headerOnly
        ? Container(
            key: key,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(
                    width: 1, color: AppConstants.COLOR_DISABLED_BUTTON),
              ),
            ),
            child: ListTile(
              contentPadding: padding,
              leading: Text(
                leftText ?? '',
                style: TextStyle(
                    fontSize: 16,
                    color: AppConstants.COLOR_GREYED_TEXT,
                    fontFamily: 'MMC-Medium',
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        : Material(
            color: Colors.white,
            child: InkWell(
              child: Container(
                key: key,
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(
                        width: 1, color: AppConstants.COLOR_DISABLED_BUTTON),
                  ),
                ),
                child: ListTile(
                  onTap: _onPress,
                  onLongPress: _onLongPress,
                  dense: dense,
                  contentPadding: padding,
                  enabled: enabled,
                  selected: selected,
                  leading: Text(
                    leftText ?? '',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'MMC-Medium',
                        fontWeight: FontWeight.w500),
                  ),
                  title: _setTitle(subInfo),
                  trailing: showArrow == true
                      ? Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          color: AppConstants.COLOR_BLACK.withOpacity(0.4),
                        )
                      : null,
                ),
              ),
            ),
          );
  }

  dynamic _setTitle(content) {
    if (switchToggle) {
      return SafeArea(
          child: Container(
        constraints: BoxConstraints(maxHeight: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              switchValue == true ? "On" : "Off",
              style: TextStyle(
                color: switchValue == true
                    ? AppConstants.COLOR_PRIMARY_COLOR
                    : AppConstants.COLOR_BLACK,
                fontSize: 16,
              ),
            ),
            Switch(
              activeColor: AppConstants.COLOR_PRIMARY_COLOR,
              activeTrackColor:
                  AppConstants.COLOR_PRIMARY_COLOR.withOpacity(0.5),
              value: switchValue,
              onChanged: _switchCallback,
            ),
          ],
        ),
      ));
    } else {
      if (content is String) {
        return Text(
          subInfo,
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 16),
        );
      }
      if (content is Widget) {
        return content;
      }
      return null;
    }
  }
}

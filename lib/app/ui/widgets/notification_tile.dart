import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sfid_mobile/app/misc/constants.dart';

class NotificationTile extends StatelessWidget {
  final String? title, subtitle, trailing, fileName;
  final bool? isRead, isSelect;
  final VoidCallback? _onLongPress, onPreviewPress, onTapAction;
  final Color? color;

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  const NotificationTile({
    Key? key,
    VoidCallback? onLongPress,
    this.onTapAction,
    this.color,
    this.isSelect = false, //active select mode
    this.fileName,
    this.onPreviewPress,
    this.title,
    this.subtitle,
    this.trailing,
    this.isRead = false,
  })  : _onLongPress = onLongPress,
        // _onTapAction = onTapAction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSelect ?? false ? onTapAction : () {},
      key: key,
      onLongPress: _onLongPress,
      splashColor: AppConstants.COLOR_NOTIFICATION_READ,
      highlightColor: AppConstants.COLOR_NOTIFICATION_READ,
      child: Container(
        key: key,
        padding: EdgeInsets.fromLTRB(
            40.0, 10, 40.0, MediaQuery.of(context).size.height * 0.02),
        // color: color,
        decoration: BoxDecoration(
            color: color,
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title ?? "",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.COLOR_BLACK)),
            Container(
                // height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: AutoSizeText(subtitle ?? "",
                    // maxLines: 3,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppConstants.COLOR_BLACK, fontSize: 12))),
            // show file name
            fileName != null
                ? Container(
                    child: InkWell(
                      onTap: onPreviewPress,
                      child: Text(
                        fileName ?? "",
                        style: TextStyle(
                          color: AppConstants.COLOR_PRIMARY_COLOR,
                          fontFamily: "MMC-Medium",
                        ),
                      ),
                    ),
                  )
                : new Container(
                    height: 16,
                  ), //show space when file name empty
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(trailing ?? "",
                    style: TextStyle(
                        color: AppConstants.COLOR_BLACK, fontSize: 12))
              ],
            )
          ],
        ),
      ),
    );
  }
}

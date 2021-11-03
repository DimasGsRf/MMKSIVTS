import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfid_mobile/app/misc/constants.dart';
import 'package:sfid_mobile/app/misc/utils.dart';
import 'package:sfid_mobile/app/ui/widgets/network_image_cache.dart';

String toString(int value) {
  const units = <int, String>{
    1000000000: 'B',
    1000000: 'M',
    1000: 'K',
  };
  return units.entries
      .map((e) => '${value ~/ e.key}${e.value}')
      .firstWhere((e) => !e.startsWith('0'), orElse: () => '$value');
}

class CommonListTile extends StatelessWidget {
  final String? title, subtitle, trailing, createdAt, name, type;
  final String? thumbnailImage;
  final int? views;
  final double? imageHeight, imageWidth, overFlowWidth;
  final bool? showImage, selected, enabled, isShadow;
  final VoidCallback? _onPress;

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  const CommonListTile(
      {Key? key,
      VoidCallback? onPress,
      this.isShadow = false,
      this.overFlowWidth = 0.0,
      this.name,
      this.thumbnailImage,
      this.type,
      this.title,
      this.subtitle,
      this.trailing,
      this.createdAt,
      this.views,
      this.selected = false,
      this.enabled = true,
      this.showImage = true,
      this.imageHeight = 90,
      this.imageWidth = 100})
      : _onPress = onPress,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: _onPress,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 14),
        child: Row(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: isShadow!
                                ? AppConstants.COLOR_BLACK
                                : Colors.transparent,
                            spreadRadius: 0.1,
                            blurRadius: 5,
                            offset: Offset(1, 1))
                      ]),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(5.0),
                    child: Image(
                      fit: BoxFit.cover,
                      height: imageHeight,
                      width: imageWidth,
                      image: thumbnailImage != null
                          ? NetworkImageCache(
                              thumbnailImage ?? '',
                            )
                          : Image.asset(
                              'lib/app/ui/assets/images/logo_slogan_light.png',
                            ) as ImageProvider,
                    ),
                  ),
                ),
                type == 'mp4'
                    ? Image.asset(
                        "lib/app/ui/assets/icons/icon_play.png",
                        width: 40,
                        height: 40,
                      )
                    : Text(""),
              ],
            ),
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width - (overFlowWidth ?? 0.0),
              padding: EdgeInsets.fromLTRB(18, 0, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        name ?? '',
                        style: TextStyle(
                            color: AppConstants.COLOR_BLACK.withOpacity(0.4),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("")
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: Text("$title",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          createdAt ?? '',
                          style: TextStyle(
                              fontSize: 10,
                              color: AppConstants.COLOR_BLACK.withOpacity(0.5)),
                        ),
                        Text(
                          "${toString(views ?? 0)} views",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppConstants.COLOR_BLACK.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }
}

enum SlidableAction { addActivity, updateStatus }

class ListTileLeadManagement extends StatelessWidget {
  ListTileLeadManagement(
      {Key? key,
      this.isFavorit = false,
      required this.isProspect,
      required this.phoneNumber,
      required this.onPressed,
      required this.salesName,
      required this.suspectName,
      required this.vehicleName,
      required this.suspectStatus,
      required this.createdAt,
      required this.onSwiped,
      required this.scaleWidth,
      required this.selectedTab})
      : super(key: key);

  final int selectedTab;
  final Function()? onPressed;
  final String createdAt;
  final bool isFavorit;
  final bool isProspect;
  final String phoneNumber;
  final String salesName;
  final double scaleWidth;
  final String suspectName;
  final String suspectStatus;
  final String vehicleName;
  final Function(SlidableAction action) onSwiped;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Slidable(
            actionExtentRatio: 0.19,
            actionPane: SlidableDrawerActionPane(),
            secondaryActions: <Widget>[
              InkWell(
                onTap: () => onSwiped(SlidableAction.addActivity),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppConstants.COLOR_DARK_GREY,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        '${AppConstants.ASSET_ICON_PATH}/ic_calendar.svg',
                        height: 20,
                        width: 20,
                        color: suspectStatus == "Baru"
                            // ||
                            //         suspectStatus == "Terkualifikasi"
                            ? AppConstants.COLOR_WHITE
                            : AppConstants.COLOR_GREYED_TEXT_TRANSPARANT,
                      ),
                      SizedBox(height: 14),
                      Text(
                        'Add\nActivity',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'MMC',
                            color: suspectStatus == "Baru"
                                // ||
                                //         suspectStatus == "Terkualifikasi"
                                ? AppConstants.COLOR_WHITE
                                : AppConstants.COLOR_GREYED_TEXT_TRANSPARANT,
                            fontSize: AppConstants.TEXT_SIZE_12,
                            fontWeight: AppConstants.FONT_WEIGHT_400,
                            height: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => onSwiped(SlidableAction.updateStatus),
                child: Container(
                  width: 10,
                  decoration: BoxDecoration(
                    color: suspectStatus == "Baru"
                        // ||
                        //         suspectStatus == "Terkualifikasi"
                        ? AppConstants.COLOR_PRIMARY_COLOR
                        : Color.fromRGBO(73, 73, 73, 1),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: suspectStatus == "Baru"
                            // ||
                            //         suspectStatus == "Terkualifikasi"
                            ? AppConstants.COLOR_WHITE
                            : AppConstants.COLOR_DISABLED_TEXT,
                      ),
                      SizedBox(height: 14),
                      Text(
                        'Update\nStatus',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'MMC',
                            color: suspectStatus == "Baru"
                                // ||
                                //         suspectStatus == "Terkualifikasi"
                                ? AppConstants.COLOR_WHITE
                                : AppConstants.COLOR_DISABLED_TEXT,
                            fontSize: AppConstants.TEXT_SIZE_12,
                            fontWeight: AppConstants.FONT_WEIGHT_400,
                            height: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppConstants.COLOR_GREY,
                ),
                child: Container(
                  padding: EdgeInsets.all(16 * scaleWidth),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            suspectName,
                            style: TextStyle(
                              fontFamily: "MMC",
                              color: AppConstants.COLOR_BLACKED_TEXT,
                              fontSize: AppConstants.TEXT_SIZE_16,
                              fontWeight: AppConstants.FONT_WEIGHT_700,
                              height: 1.5,
                            ),
                          ),
                          Text(
                            createdAt,
                            style: TextStyle(
                              fontFamily: "MMC",
                              color: AppConstants.COLOR_GREYED_TEXT,
                              fontSize: AppConstants.TEXT_SIZE_14,
                              fontWeight: AppConstants.FONT_WEIGHT_400,
                              height: 1.2,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 12 * scaleWidth),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Utils.phoneNumberFormat(phoneNumber),
                            style: TextStyle(
                              fontFamily: "MMC",
                              color: AppConstants.COLOR_GREYED_TEXT,
                              fontSize: AppConstants.TEXT_SIZE_12,
                              fontWeight: AppConstants.FONT_WEIGHT_400,
                              height: 1.2,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: suspectStatus == "Baru"
                                      ? const Color.fromRGBO(90, 176, 0, 0.1)
                                      : suspectStatus == "Terkualifikasi"
                                          ? const Color.fromRGBO(
                                              236, 85, 0, 0.1)
                                          : const Color.fromRGBO(
                                              176, 42, 0, 0.1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5 * scaleWidth),
                                  ),
                                ),
                                padding: EdgeInsets.all(4 * scaleWidth),
                                child: Text(
                                  suspectStatus.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: AppConstants.FONT_WEIGHT_700,
                                      fontFamily: "MMC",
                                      color: suspectStatus == "Baru"
                                          ? const Color.fromRGBO(9, 174, 154, 1)
                                          : suspectStatus == "Terkualifikasi"
                                              ? const Color.fromRGBO(
                                                  236, 85, 0, 1)
                                              : const Color.fromRGBO(
                                                  251, 38, 76, 1),
                                      fontSize: AppConstants.TEXT_SIZE_12,
                                      height: 1.2),
                                ),
                              ),
                              if (selectedTab == 2) ...[
                                SizedBox(height: 4 * scaleWidth),
                                Text(
                                  "HOT PROSPECT",
                                  style: TextStyle(
                                      fontWeight: AppConstants.FONT_WEIGHT_700,
                                      fontFamily: "MMC",
                                      color: Colors.black,
                                      fontSize: AppConstants.TEXT_SIZE_12,
                                      height: 1.2),
                                )
                              ]
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4 * scaleWidth),
                      Text(
                        vehicleName,
                        style: TextStyle(
                          fontFamily: "MMC",
                          color: AppConstants.COLOR_GREYED_TEXT,
                          fontSize: AppConstants.TEXT_SIZE_12,
                          fontWeight: AppConstants.FONT_WEIGHT_400,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 4 * scaleWidth),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            salesName,
                            style: TextStyle(
                              fontFamily: "MMC",
                              color: AppConstants.COLOR_GREYED_TEXT,
                              fontSize: AppConstants.TEXT_SIZE_12,
                              fontWeight: AppConstants.FONT_WEIGHT_400,
                              height: 1.2,
                            ),
                          ),
                          if (isFavorit)
                            SvgPicture.asset(
                              '${AppConstants.ASSET_ICON_PATH}/star.svg',
                              width: 19 * scaleWidth,
                              height: 19 * scaleWidth,
                              // color: Colors.white,
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12 * scaleWidth),
        ],
      ),
    );
  }
}

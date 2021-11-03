import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfid_mobile/app/misc/constants.dart';
import 'package:sfid_mobile/app/ui/pages/pages.dart';

typedef VoidFutureCallBack = Future<void> Function();

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isPKTorSPKTrackingPage;
  final String? title;
  final String? rightText;
  final String? hintSearchText;
  final FontWeight fontWeight;
  final Widget? iconLeft;
  final Widget? iconRight;
  final Widget? filterWidget;
  final Widget? optionMenuWidget;
  final VoidCallback? onRightPressed,
      onLeftPress,
      onBackPressed,
      onNotifPressed,
      onSortPressed,
      onRightTitlePressed;
  final VoidFutureCallBack? onDownloadPressed;
  final bool? isNotif,
      isBack,
      searchActive,
      downloadActive,
      showSetting,
      centerTitle,
      showInfo,
      hasNotification,
      showFilters,
      showSort,
      showMenu;
  final TextEditingController? _searchController;
  final Function(String)? _onChangeHandler;
  final FocusNode? _focusNode;
  final PreferredSizeWidget? bottom;
  final double? fontSize;

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  const CommonAppBar(
      //String title,
      {Key? key,
      this.title,
      this.rightText,
      this.hintSearchText,
      this.fontWeight = FontWeight.w700,
      this.onNotifPressed,
      this.iconLeft,
      this.onLeftPress,
      this.iconRight = const Icon(Icons.notifications),
      this.hasNotification = false,
      this.isNotif = false,
      this.isBack = false,
      this.filterWidget,
      this.searchActive = false,
      this.downloadActive = false,
      this.onDownloadPressed,
      this.showSetting = false,
      this.showFilters = false,
      this.showSort = false,
      this.showMenu = false,
      this.optionMenuWidget,
      this.centerTitle = false,
      this.showInfo = false,
      this.isPKTorSPKTrackingPage = false,
      TextEditingController? searchController,
      Function(String)? onChangeHandler,
      FocusNode? focusNode,
      this.bottom,
      this.onBackPressed,
      this.onRightPressed,
      this.onSortPressed,
      this.fontSize,
      this.onRightTitlePressed})
      : _searchController = searchController,
        _focusNode = focusNode,
        _onChangeHandler = onChangeHandler,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: key,
      centerTitle: centerTitle,
      titleSpacing: 0.0,
      iconTheme: IconThemeData(
          color: searchActive ?? false
              ? AppConstants.COLOR_BLACK
              : AppConstants.COLOR_WHITE),
      actionsIconTheme: IconThemeData(
          color: searchActive ?? false
              ? AppConstants.COLOR_BLACK
              : AppConstants.COLOR_WHITE),
      automaticallyImplyLeading: true,
      brightness: Brightness.dark,
      elevation: 0.1,
      backgroundColor: searchActive ?? false
          ? AppConstants.COLOR_WHITE
          : AppConstants.COLOR_BLACK,
      title: searchActive ?? false
          ? TextField(
              autofocus: searchActive ?? false,
              controller: _searchController,
              decoration:
                  InputDecoration(hintText: hintSearchText ?? "Cari..."),
              style: TextStyle(fontFamily: "MMC", fontSize: 12),
              focusNode: _focusNode,
              onSubmitted: _onChangeHandler)
          : rightText != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title ?? "",
                      maxLines: 2,
                      style: TextStyle(
                          fontFamily: "MMCOFFICE",
                          fontWeight: fontWeight,
                          fontSize: fontSize != null ? fontSize : 12),
                    ),
                    GestureDetector(
                        child: Text(
                          rightText ?? "",
                          style: TextStyle(
                              color: AppConstants.COLOR_RED,
                              fontFamily: 'MMC',
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                        onTap: onRightTitlePressed),
                  ],
                )
              : AutoSizeText(
                  title ?? "",
                  maxFontSize: 20,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: "MMCOFFICE",
                      fontWeight: fontWeight,
                      fontSize: 16),
                ),
      leading: isPKTorSPKTrackingPage
          ? IconButton(
              onPressed: onBackPressed,
              icon: Icon(Icons.arrow_back),
            )
          : isBack ?? false
              ? IconButton(
                  onPressed: onBackPressed ??
                      () {
                        Navigator.pop(context);
                      },
                  icon: Icon(Icons.arrow_back),
                )
              : iconLeft ??
                  IconButton(
                    icon: new Image.asset(
                        "lib/app/ui/assets/icons/app_bar_icon_mitsubishi.png"),
                    onPressed: () {},
                    iconSize: 20,
                    splashColor: Colors.transparent,
                  ),
      actions: <Widget>[
        if (isBack ?? false)
          IconButton(
            icon: showInfo ?? false
                ? Icon(Icons.info)
                : searchActive ?? false
                    ? Icon(Icons.close)
                    : Icon(Icons.search),
            onPressed: onRightPressed,
          ),
        if (isNotif ?? false) // Using Stack to show Notification Badge
          new Stack(
            children: <Widget>[
              new IconButton(
                  icon: Icon(Icons.notifications), onPressed: onNotifPressed),
              hasNotification ?? false
                  ? new Positioned(
                      right: 11,
                      top: 11,
                      child: new Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: AppConstants.COLOR_PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              color: AppConstants.COLOR_BLACK, width: 1),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                      ),
                    )
                  : new SizedBox()
            ],
          ),
        if (showSetting ?? false)
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, Pages.setting);
            },
          ),
        if (showSetting ?? false)
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, Pages.settingInfo);
            },
          ),
        if (showSort ?? false)
          Row(
            children: [
              InkWell(
                onTap: onSortPressed,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 32,
                  height: 32,
                  child: Center(
                    child: SvgPicture.asset(
                      '${AppConstants.ASSET_ICON_PATH}/sort.svg',
                      width: 20,
                      height: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 28,
              )
            ],
          ),
        if (showFilters ?? false) filterWidget ?? SizedBox(),
        if (downloadActive ?? false)
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: onDownloadPressed,
          ),
        // if (showMenu ?? false)
        //   IconButton(
        //     icon: Icon(Icons.more_vert),
        //     onPressed: onDownloadPressed,
        //   ),
        if (showMenu ?? false) optionMenuWidget ?? SizedBox()
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(
      kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}

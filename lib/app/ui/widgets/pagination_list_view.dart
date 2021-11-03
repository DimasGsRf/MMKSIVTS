import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PaginationListView extends StatelessWidget {
  final RefreshController refreshController;
  final VoidCallback? onPullDownPageTriggered, onPullUpPageTriggered;
  final Widget child;

  const PaginationListView({
    required this.refreshController,
    required this.child,
    this.onPullDownPageTriggered,
    this.onPullUpPageTriggered,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      enablePullDown: true,
      onRefresh: onPullDownPageTriggered,
      header: ClassicHeader(refreshStyle: RefreshStyle.Follow),
      onLoading: onPullUpPageTriggered,
      child: child,
    );
  }
}

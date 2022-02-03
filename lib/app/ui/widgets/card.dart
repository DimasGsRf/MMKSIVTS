import 'package:flutter/material.dart';
import 'package:soid_mobile/app/misc/constants.dart';
import 'package:soid_mobile/app/ui/widgets/expansion_tile.dart';

class CardCommon extends StatelessWidget {
  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  CardCommon({Key? key, this.ask, this.answer}) : super(key: key);
  final String? ask;
  final String? answer;
  @override
  Widget build(BuildContext context) {
    return ConfigurableExpansionTile(
      animatedWidgetFollowingHeader: const Icon(
        Icons.expand_more,
        color: const Color(0xFF707070),
      ),
      header: Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.05, 15, 0, 15),
        child: Text(
          ask ?? "",
          style: TextStyle(
              fontFamily: 'MMC', fontSize: 14, color: AppConstants.COLOR_BLACK),
        ),
      ),
      headerBackgroundColorStart: Colors.white,
      expandedBackgroundColor: AppConstants.COLOR_PRIMARY_BACKGROUND,
      headerBackgroundColorEnd: Colors.white,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
              10, MediaQuery.of(context).size.width * 0.10, 15),
          child: Text(
            answer ?? "",
            style: TextStyle(
              fontFamily: 'MMC',
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}

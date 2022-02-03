import 'package:flutter/material.dart';
import 'package:mmksi_vts_mobile/app/misc/constants.dart';

class CommonWatermark extends StatelessWidget {
  final String? text;
  final bool? potrait;
  const CommonWatermark({Key? key, @required this.text, this.potrait = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height * 0.12;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: potrait ?? false ? sizeHeight * 2 : sizeHeight,
                  width: potrait ?? false ? sizeHeight * 2 : sizeHeight,
                  child: Image.asset(
                    'lib/app/ui/assets/images/watermark_logo.png',
                    width: potrait ?? false ? sizeWidth * 5 : sizeWidth * 0.40,
                    height: potrait ?? false ? sizeWidth * 5 : sizeWidth * 0.40,
                  ),
                ),
                Container(
                  child: Text(
                    text ?? "",
                    style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.transparent,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                        foreground: Paint()
                          ..color = AppConstants.COLORED_GREYED_TEXT_TRANSPARANT
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2,
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(right: 90),
          //   child: Column(
          //     // mainAxisAlignment: MainAxisAlignment.start,
          //     children: <Widget>[
          //       Container(
          //         height: size,
          //         width: size,
          //         child: Image.asset(
          //           'lib/app/ui/assets/images/watermark_logo.png',
          //         ),
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(bottom: 90),
          //         child: Text(
          //           text,
          //           style: TextStyle(
          //               shadows: [
          //                 Shadow(
          //                   blurRadius: 2.0,
          //                   color: Colors.transparent,
          //                   offset: Offset(1.0, 1.0),
          //                 ),
          //               ],
          //               foreground: Paint()
          //                 ..color = AppConstants.COLORED_GREYED_TEXT_TRANSPARANT
          //                 ..style = PaintingStyle.stroke
          //                 ..strokeWidth = 2.0,
          //               fontSize: 50,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sfid_mobile/app/misc/constants.dart';

class StepperButton extends StatelessWidget {
  StepperButton(
      {Key? key,
      required this.onPressedButtonLeft,
      required this.validateStep,
      required this.onPressedButtonRight,
      required this.scaleWidth,
      required this.leftText,
      required this.righText,
      this.iconLeft,
      this.iconRight,
      required this.isRigth})
      : super(key: key);
  final String leftText, righText;
  final Icon? iconLeft, iconRight;
  final void Function() onPressedButtonLeft;
  final double scaleWidth;
  final bool validateStep;
  final bool isRigth;
  final void Function() onPressedButtonRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              margin: EdgeInsets.only(top: 38 * scaleWidth),
              height: 52,
              child: ElevatedButton(
                  onPressed: () => onPressedButtonLeft.call(),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: AppConstants.COLOR_NOTIFICATION_READ,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (iconLeft != null) ...[
                        SizedBox(width: 10 * scaleWidth),
                        iconLeft!
                      ],
                      Text(
                        leftText,
                        style: TextStyle(
                          color: AppConstants.COLOR_PRIMARY_COLOR,
                          fontWeight: AppConstants.FONT_WEIGHT_500,
                          fontSize: AppConstants.TEXT_SIZE_14,
                        ),
                      ),
                    ],
                  ))),
        ),
        Expanded(
          child: Container(
              margin:
                  EdgeInsets.only(left: 12 * scaleWidth, top: 38 * scaleWidth),
              height: 52,
              child: ElevatedButton(
                  onPressed: () {
                    if (validateStep == true) onPressedButtonRight.call();
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      primary: validateStep
                          ? AppConstants.COLOR_PRIMARY_COLOR
                          : Color.fromRGBO(33, 33, 33,
                              0.12) //AppConstants.COLOR_GREYED_TEXT,
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      if (isRigth) ...[
                        Text(
                          righText,
                          style: TextStyle(
                            color: validateStep
                                ? AppConstants.COLOR_WHITE
                                : Color.fromRGBO(62, 62, 62,
                                    0.48), //AppConstants.COLOR_WHITE,
                            fontWeight: AppConstants.FONT_WEIGHT_500,
                            fontSize: AppConstants.TEXT_SIZE_14,
                          ),
                        ),
                        if (iconRight != null) ...[
                          SizedBox(width: 10 * scaleWidth),
                          iconRight!
                        ],
                      ] else ...[
                        if (iconRight != null) ...[iconRight!],
                        SizedBox(width: 10 * scaleWidth),
                        Text(
                          righText,
                          style: TextStyle(
                            color: validateStep
                                ? AppConstants.COLOR_WHITE
                                : Color.fromRGBO(62, 62, 62,
                                    0.48), //AppConstants.COLOR_WHITE,
                            fontWeight: AppConstants.FONT_WEIGHT_500,
                            fontSize: AppConstants.TEXT_SIZE_14,
                          ),
                        ),
                      ]
                    ],
                  ))),
        ),
      ],
    );
  }
}

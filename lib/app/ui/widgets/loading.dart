import 'dart:math';

import 'package:flutter/material.dart';
import 'package:soid_mobile/app/misc/constants.dart';

class CommonLoading extends StatelessWidget {
  final Color color;

  CommonLoading({this.color = AppConstants.COLOR_PRIMARY_COLOR}) : super();

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: AppConstants.COLOR_WHITE,
      valueColor: AlwaysStoppedAnimation<Color>(color),
      strokeWidth: 2,
    );
  }
}

class MitsubishiCustomLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColorLoader3();
  }
}

class ColorLoader3 extends StatefulWidget {
  final double radius;

  ColorLoader3({
    this.radius = 60.0,
  });

  @override
  _ColorLoader3State createState() => _ColorLoader3State();
}

class _ColorLoader3State extends State<ColorLoader3>
    with SingleTickerProviderStateMixin {
  late Animation<double> animationRotation;
  late AnimationController controller;

  late double radius;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    animationRotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      //color: Colors.black12,
      child: new Center(
        child: new RotationTransition(
          turns: animationRotation,
          child: new Container(
            //color: Colors.limeAccent,
            child: new Center(
              child: Stack(
                children: <Widget>[
                  new Transform.translate(
                    offset: Offset(0.0, 0.0),
                    child: Logo(
                      radius: radius,
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Logo extends StatelessWidget {
  final double radius;
  final Color? color;
  final DotType? type;
  final Icon? icon;

  Logo({required this.radius, this.color, this.type, this.icon});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: type == DotType.icon
          ? Icon(
              icon?.icon,
              color: color,
              size: 1.3 * radius,
            )
          : new Transform.rotate(
              angle: type == DotType.diamond ? pi / 4 : 0.0,
              child: Container(
                width: radius,
                height: radius,
                child:
                    Image.asset('lib/app/ui/assets/icons/logo-mitsubishi.png'),
                decoration: BoxDecoration(
                    // color: Colors.red,
                    shape: type == DotType.circle
                        ? BoxShape.circle
                        : BoxShape.rectangle),
              ),
            ),
    );
  }
}

enum DotType { square, circle, diamond, icon }

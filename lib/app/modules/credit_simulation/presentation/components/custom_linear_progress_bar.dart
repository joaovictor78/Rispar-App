import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../_design_system/styles/color_palettes.dart';

// ignore: must_be_immutable
class CustomLinearProgressBarComponent extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CustomLinearProgressBarComponent({this.percent = 0.0});
  double percent = 0.0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 70),
        child: LinearPercentIndicator(
          progressColor: ColorPalettes.accentPrimary,
          barRadius: const Radius.circular(20),
          animationDuration: 1000,
          lineHeight: 7,
          animateFromLastPercent: true,
          percent: (percent * 10).ceil() / 10,
        ),
      ),
    );
  }
}

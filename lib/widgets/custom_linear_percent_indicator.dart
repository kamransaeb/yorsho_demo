import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../core/app_scale/app_scale.dart';
import '../core/app_theme/app_theme.dart';
import '../core/constants/app_dimensions/app_dimensions.dart';

class CustomLinearPercentIndicator extends StatelessWidget {
  final double percent;

  const CustomLinearPercentIndicator({
    required this.percent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return LinearPercentIndicator(
      progressColor: AppTheme.primaryColor,
      backgroundColor: AppTheme.greyColor5,
      lineHeight: AppDimensions.customLinearPercentIndicatorLineWidth,
      padding: EdgeInsets.zero,
      barRadius:  Radius.circular(scale.pagePadding * 10),
      restartAnimation: false,
      percent: percent,
    );
  }

}

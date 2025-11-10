import 'package:flutter/material.dart';
import '../core/app_theme/app_theme.dart';
import '../core/constants/app_dimensions/app_dimensions.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double? value;

  const CustomCircularProgressIndicator({this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      strokeWidth: AppDimensions.myAppBarToolbarItemUnderlineWidth,
      strokeCap: StrokeCap.round,
      color: AppTheme.blackColor,
    );
  }
}
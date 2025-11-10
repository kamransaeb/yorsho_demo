import 'package:flutter/material.dart';

import '../../core/app_theme/app_theme.dart';
import '../../core/constants/app_dimensions/app_dimensions.dart';

class CustomRoundIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final Key? iconButtonKey;
  final bool border;
  final Color borderColor;
  final Color boxColor;
  final double paddingSize;

  const CustomRoundIconButton({
    required this.onPressed,
    required this.icon,
    this.iconButtonKey,
    this.border = true,
    this.borderColor = AppTheme.iconColor,
    this.boxColor = AppTheme.whiteColor,
    required this.paddingSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed == null ? null : () => onPressed!(),
        child: Container(
          padding: EdgeInsets.all(paddingSize),
          decoration: BoxDecoration(
            border: Border.all(
              color: border ? borderColor : boxColor,
              width: border ? AppDimensions.borderLineWidth : 0.0,
            ),
            shape: BoxShape.circle,
            color: boxColor,
          ),
          child: icon,
        ),
      ),
    );
  }
}

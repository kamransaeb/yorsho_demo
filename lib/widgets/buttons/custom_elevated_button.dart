import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/app_theme/app_theme.dart';
import '../../core/constants/app_dimensions/app_dimensions.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Key? elevatedButtonKey;
  final Color? color;
  final bool? minimumSize;
  final Color? outlineColor;

  const CustomElevatedButton({
    required this.onPressed,
    required this.child,
    this.elevatedButtonKey,
    this.color,
    this.minimumSize,
    this.outlineColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: elevatedButtonKey,
      style: ElevatedButton.styleFrom(
        padding:
        EdgeInsets.symmetric(horizontal: AppDimensions.pagePadding / 2),
        disabledBackgroundColor: AppTheme.greyColor3,
        backgroundColor: color ?? AppTheme.whiteColor,
        overlayColor: color ?? AppTheme.whiteColor,
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: Colors.transparent,
        foregroundColor: color ?? AppTheme.whiteColor,
        shadowColor: Colors.transparent,
        minimumSize: (minimumSize == null || minimumSize == true)
            ? const Size(AppDimensions.buttonWidth, AppDimensions.buttonHeight)
            : null,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

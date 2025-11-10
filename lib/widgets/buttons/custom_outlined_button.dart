import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/app_theme/app_theme.dart';
import '../../core/constants/app_dimensions/app_dimensions.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Key? outlinedButtonKey;
  final Color? color;
  final bool? minimumSize;
  final Color? outlineColor;

  const CustomOutlinedButton({
    required this.onPressed,
    required this.child,
    this.outlinedButtonKey,
    this.color,
    this.minimumSize,
    this.outlineColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: outlinedButtonKey,
      style: OutlinedButton.styleFrom(

        padding:
        EdgeInsets.symmetric(horizontal: AppDimensions.pagePadding / 2),
        side: BorderSide(color: outlineColor ?? Colors.transparent, width: AppDimensions.borderLineWidth,),
        disabledBackgroundColor: AppTheme.greyColor3,
        backgroundColor: color ?? AppTheme.whiteColor,
        overlayColor: color ?? AppTheme.whiteColor,
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: Colors.transparent,
        foregroundColor: color ?? AppTheme.whiteColor,
        shadowColor: Colors.transparent,
        minimumSize: (minimumSize == null || minimumSize == true) ? const Size(AppDimensions.buttonWidth, AppDimensions.buttonHeight) : null,
      ),
      onPressed: onPressed,
      child: child,

    );
  }
}
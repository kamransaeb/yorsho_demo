import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Key? textButtonKey;

  const CustomTextButton({
    required this.onPressed,
    required this.child,
    this.textButtonKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      key: textButtonKey,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        overlayColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: Colors.transparent,
      ),
      onPressed: onPressed == null ? null : () => onPressed!(),
      child: child,
    );
  }
}
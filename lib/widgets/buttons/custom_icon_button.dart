import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final Key? iconButtonKey;

  const CustomIconButton({
    required this.onPressed,
    required this.icon,
    this.iconButtonKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return  IconButton(
      key: iconButtonKey,
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        overlayColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: Colors.transparent,
      ),
      onPressed: onPressed == null ? null : () => onPressed!(),
      icon: icon,
    );
  }
}
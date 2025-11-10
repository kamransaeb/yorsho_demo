import 'package:flutter/material.dart';

import '../core/app_theme/app_theme.dart';

BoxShadow shadow() {
  return BoxShadow(
    spreadRadius: 0.1,
    offset: const Offset(0,3),
    blurRadius: 9,
    color: AppTheme.blackColor.withOpacity(.2),
  );
}

BoxShadow shadowZero() {
  return  BoxShadow(
    spreadRadius: 0,
    offset: const Offset(0,0),
    blurRadius: 0,
    color: AppTheme.blackColor.withOpacity(0),
  );
}
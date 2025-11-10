import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/app_theme/app_theme.dart';
import '../custom_circular_progress_indicator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: AppTheme.whiteColor,
      child: Center(
        child: CustomCircularProgressIndicator(),
      ),
    );
  }
}


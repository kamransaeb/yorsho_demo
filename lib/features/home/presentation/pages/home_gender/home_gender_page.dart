import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_localization/app_localization.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../injector/injector.dart';
import '../../../../../widgets/buttons/custom_icon_button.dart';
import '../../../../../widgets/svg_icon.dart';
import '../../bloc/home_gender/home_gender_bloc.dart';
import 'home_gender_form.dart';

class HomeGenderPage extends StatelessWidget {
  final UserYorshoEntity userYorshoEntity;

  const HomeGenderPage({required this.userYorshoEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeGenderBloc>(
      create: (_) => Injector.instance<HomeGenderBloc>()
        ..add(HomeGenderEventFetched(
            userYorshoEntity: userYorshoEntity)),
      child: _build(context),
    );
  }

  _build(BuildContext context) {
    AppScale scale = AppScale(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          onPressed: () {
            return Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          icon: const SvgIcon(
            asset: AssetsIcons.arrowLeft,
            color: AppTheme.iconColor,
            size: AppDimensions.iconSizeMedium,
          ),
        ),
        title:
        Text(AppLocalizations.of(context)!.translate('gender')!),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: scale.pagePadding,
          bottom: (Platform.isIOS ? scale.pagePadding : scale.pagePadding * 3),
        ),
        child: _buildMain(context),
      ),
    );
  }

  _buildMain(BuildContext context) {
    return HomeGenderForm(userYorshoEntity: userYorshoEntity);
  }

}

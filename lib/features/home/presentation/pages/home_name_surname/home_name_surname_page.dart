import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_localization/app_localization.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../injector/injector.dart';
import '../../bloc/home_gender/home_gender_bloc.dart';
import '../../bloc/home_name_surname/home_name_surname_bloc.dart';
import 'home_name_surname_form.dart';

class HomeNameSurnamePage extends StatelessWidget {
  final UserYorshoEntity userYorshoEntity;

  const HomeNameSurnamePage({required this.userYorshoEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeNameSurnameBloc>(
      create: (_) => Injector.instance<HomeNameSurnameBloc>()
        ..add(HomeNameSurnameEventFetched(
            userYorshoEntity: userYorshoEntity)),
      child: _build(context),
    );
  }

  _build(BuildContext context) {
    AppScale scale = AppScale(context);
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.translate('name_and_surname')!),
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
    return HomeNameSurnameForm(userYorshoEntity: userYorshoEntity);
  }

}

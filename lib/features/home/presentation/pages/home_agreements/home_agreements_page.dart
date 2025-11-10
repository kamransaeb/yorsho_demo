import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/app_localization/app_localization.dart';
import '../../../../../core/app_router/app_router.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../injector/injector.dart';
import '../../bloc/home_agreements/home_agreements_bloc.dart';
import 'home_agreements_form.dart';

class HomeAgreementsPage extends StatelessWidget {
  final UserYorshoEntity userYorshoEntity;

  const HomeAgreementsPage({required this.userYorshoEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeAgreementsBloc>(
      create: (_) => Injector.instance<HomeAgreementsBloc>()
        ..add(HomeAgreementsEventFetched(
            userYorshoEntity: userYorshoEntity)),
      child: _build(context),
    );
  }

  _build(BuildContext context) {
    AppScale scale = AppScale(context);
    return Scaffold(
      appBar: AppBar(
        title:
        Text(AppLocalizations.of(context)!.translate('agreements')!),
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
    return   BlocListener<HomeAgreementsBloc, HomeAgreementsState>(
            listenWhen: (previous, current) {
              return (previous.homeAgreementsStatus !=
                  current.homeAgreementsStatus);
            },
            listener: (context, state) async {
              if (state.homeAgreementsStatus ==
                  HomeAgreementsStatus.failure) {
                await Flushbar(
                  duration: const Duration(seconds: 3),
                  title:
                  AppLocalizations.of(context)!.translate('failure')!,
                  message: AppLocalizations.of(context)!
                      .translate(state.failure.message!)!,
                  flushbarPosition: FlushbarPosition.TOP,
                ).show(context);
              } else if
              (state.homeAgreementsCompleteStatus ==
                  HomeAgreementsCompleteStatus.failure) {
                await Flushbar(
                  duration: const Duration(seconds: 3),
                  title:
                  AppLocalizations.of(context)!.translate('failure')!,
                  message: AppLocalizations.of(context)!
                      .translate(state.failure.message!)!,
                  flushbarPosition: FlushbarPosition.TOP,
                ).show(context);
              } else if (state.homeAgreementsCompleteStatus ==
                  HomeAgreementsCompleteStatus.success) {
                context.go(AppRouter.homePath,);
              }
            },
            child: HomeAgreementsForm(userYorshoEntity: userYorshoEntity),
          );

  }


}


import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/app_localization/app_localization.dart';
import '../../../../../core/app_router/app_router.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../injector/injector.dart';
import '../../../../../widgets/buttons/custom_icon_button.dart';
import '../../../../../widgets/svg_icon.dart';
import '../../bloc/home_profile_photo/home_profile_photo_bloc.dart';
import 'home_profile_photo_form.dart';

class HomeProfilePhotoPage extends StatelessWidget {
  final UserYorshoEntity userYorshoEntity;

  const HomeProfilePhotoPage({required this.userYorshoEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeProfilePhotoBloc>(
      create: (_) => Injector.instance<HomeProfilePhotoBloc>()
        ..add(HomeProfilePhotoEventFetched(
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
        title: Text(AppLocalizations.of(context)!.translate('profile_photo')!),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: scale.pagePadding,
          bottom:
              (Platform.isIOS ? scale.pagePadding : scale.pagePadding * 3),
        ),
        child: _buildMain(context),
      ),
    );
  }

  _buildMain(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeProfilePhotoBloc, HomeProfilePhotoState>(
          listenWhen: (previous, current) {
            return (previous.homeProfilePhotoImageSelectStatus !=
                current.homeProfilePhotoImageSelectStatus);
          },
          listener: (context, state) async {
            if (state.homeProfilePhotoImageSelectStatus ==
                HomeProfilePhotoImageSelectStatus.failure) {
              await Flushbar(
                duration: const Duration(seconds: 3),
                title: AppLocalizations.of(context)!.translate('failure')!,
                message: AppLocalizations.of(context)!
                    .translate(state.failure.message!)!,
                flushbarPosition: FlushbarPosition.TOP,
              ).show(context);
            }
          },
        ),
        BlocListener<HomeProfilePhotoBloc, HomeProfilePhotoState>(
          listenWhen: (previous, current) {
            return (previous.homeProfilePhotoImageUploadStatus !=
                current.homeProfilePhotoImageUploadStatus);
          },
          listener: (context, state) async {
            if (state.homeProfilePhotoImageUploadStatus ==
                HomeProfilePhotoImageUploadStatus.failure) {
              await Flushbar(
                duration: const Duration(seconds: 3),
                title: AppLocalizations.of(context)!.translate('failure')!,
                message: AppLocalizations.of(context)!
                    .translate(state.failure.message!)!,
                flushbarPosition: FlushbarPosition.TOP,
              ).show(context);
            }
          },
        ),
        BlocListener<HomeProfilePhotoBloc, HomeProfilePhotoState>(
          listenWhen: (previous, current) {
            return (previous.homeProfilePhotoStatus !=
                current.homeProfilePhotoStatus);
          },
          listener: (context, state) async {
            if (state.homeProfilePhotoStatus ==
                HomeProfilePhotoStatus.failure) {
              await Flushbar(
                duration: const Duration(seconds: 3),
                title: AppLocalizations.of(context)!.translate('failure')!,
                message: AppLocalizations.of(context)!
                    .translate(state.failure.message!)!,
                flushbarPosition: FlushbarPosition.TOP,
              ).show(context);
            } else if (state.homeProfilePhotoStatus ==
                HomeProfilePhotoStatus.success) {
              context.go(
                  '${AppRouter.homeNameSurnamePath}/${AppRouter.homeBirthDatePath}/${AppRouter.homeGenderPath}/${AppRouter.homeProfilePhotoPath}/${AppRouter.homeAgreementsPath}',
                  extra: context
                      .read<HomeProfilePhotoBloc>()
                      .state
                      .userYorshoEntity);
            }
          },
        ),
      ],
      child: HomeProfilePhotoForm(userYorshoEntity: userYorshoEntity),
    );
  }

}

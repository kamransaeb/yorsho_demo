import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../injector/injector.dart';
import '../../../../widgets/dialog/show_update_app_dialog.dart';
import '../../../../widgets/pages/splash_page.dart';
import '../../../app/presentation/bloc/app_bloc.dart';
import '../bloc/app_director_bloc.dart';

class AppDirectorPage extends StatelessWidget {
  const AppDirectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          Injector.instance<AppDirectorBloc>()
            ..add(const AppDirectorEventFetched()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<AppDirectorBloc, AppDirectorState>(
            buildWhen: (previous, current) =>
                previous.appDirectorStatus != current.appDirectorStatus,
            builder: (context, state) {
              if (state.appDirectorStatus == AppDirectorStatus.initial) {
                return const SplashPage();
              } else if (state.appDirectorStatus == AppDirectorStatus.loading) {
                return const SplashPage();
              } else if (state.appDirectorStatus == AppDirectorStatus.failure) {
                if (state.isAppUpdate) {
                  Future.delayed(
                    const Duration(seconds: 5),
                    () => context.read<AppDirectorBloc>().add(
                      const AppDirectorEventFetched(),
                    ),
                  );
                }

                return const SplashPage();
              } else if (state.appDirectorStatus == AppDirectorStatus.success) {
                // final bool isFirstUse = state.isFirstUse;
                // if (isFirstUse) {
                //   return const IntroPage();
                // } else {
                return const SplashPage();
                // }
              }
              return const SplashPage();
            },
            listenWhen: (previous, current) =>
                previous.appDirectorStatus != current.appDirectorStatus,
            listener: (context, state) {
              if (state.appDirectorStatus == AppDirectorStatus.success
              //    && !state.isFirstUse
              ) {
                if (state.userYorshoEntity.profileCompleted == false) {
                  context.go(
                    AppRouter.homeNameSurnamePath,
                    extra: state.userYorshoEntity,
                  );
                } else {
                  context.go(AppRouter.homePath);
                }
              } else if (state.appDirectorStatus == AppDirectorStatus.failure) {
                if (!state.isAppUpdate) {
                  int appId = Platform.isIOS ? 1 : 2;
                  String updateAppAsset;
                  String updateAppStoreUrl;
                  if (context.read<AppBloc>().state.locale == 'tr') {
                    updateAppStoreUrl = state.updateAppStoreUrlTr;
                    if (appId == 1) {
                      updateAppAsset = AssetsIcons.appStoreTr;
                    } else {
                      updateAppAsset = AssetsIcons.googlePlayTr;
                    }
                  } else {
                    updateAppStoreUrl = state.updateAppStoreUrlEn;
                    if (appId == 1) {
                      updateAppAsset = AssetsIcons.appStoreEn;
                    } else {
                      updateAppAsset = AssetsIcons.googlePlayEn;
                    }
                  }

                  showUpdateAppDialog(
                    context,
                    state.failure.message!,
                    updateAppAsset,
                    updateAppStoreUrl,
                  );
                }
              }
            },
          );
        },
      ),
    );
  }
}

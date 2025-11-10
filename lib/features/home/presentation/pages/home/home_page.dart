import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_localization/app_localization.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../injector/injector.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../bloc/home/home_bloc.dart';
import '../../widgets/home/home_videos_list_horizontal_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return BlocProvider(
      create: (_) => Injector.instance<HomeBloc>()..add(HomeEventFetched()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: _buildAppBar(context),
            body: _buildBody(context),
          );
        },
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    AppScale scale = AppScale(context);
    return AppBar(
      title: Text(AppLocalizations.of(context)!.translate('home_videos')!),
      actions: <Widget>[Container()],
    );
  }

  _buildBody(BuildContext context) {
    AppScale scale = AppScale(context);

    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (current, previous) =>
          previous.homeStatus != current.homeStatus,
      listener: (context, state) async {
        if (state.homeStatus == HomeStatus.failure) {
          await Flushbar(
            duration: const Duration(seconds: 3),
            title: AppLocalizations.of(context)!.translate('failure')!,
            message: AppLocalizations.of(
              context,
            )!.translate(state.failure.message ?? 'failure'),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
      },
      builder: (context, state) {
        if (state.homeStatus == HomeStatus.loading) {
          return const Center(child: CustomCircularProgressIndicator());
        }
        if (state.homeStatus == HomeStatus.failure) {
          return Center(
            child: Text(
              AppLocalizations.of(
                context,
              )!.translate(state.failure.message ?? 'failure')!,
            ),
          );
        }
        if (state.homeStatus == HomeStatus.success) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              bottom: (Platform.isIOS ? 0 : scale.pagePadding * 3),
            ),
            physics: const ClampingScrollPhysics(),
            itemCount: state.videosCategoryIndexVideosIndex.length,
            itemBuilder: (context, index) {
              return HomeVideosListHorizontalBox(
                // key: UniqueKey(),
                videosIndexList: state.videosCategoryIndexVideosIndex[index],
                videosCategoryIndex: index,
              );
            },
          );
        }
        return Container();
      },
    );
  }
}

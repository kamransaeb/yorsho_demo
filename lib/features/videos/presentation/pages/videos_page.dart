
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_localization/app_localization.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/app_scale/app_scale.dart';
import '../../../../core/app_theme/app_theme.dart';
import '../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../entities/videos/videos_entity.dart';
import '../../../../injector/injector.dart';
import '../../../../widgets/buttons/custom_icon_button.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/svg_icon.dart';
import '../../../app/presentation/bloc/app_bloc.dart';
import '../bloc/videos_bloc.dart';
import '../widgets/videos_box.dart';

class VideosPage extends StatelessWidget {
  final VideosEntity? videosEntity;

  const VideosPage({
    required this.videosEntity,
    super.key,});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return BlocProvider(
      create: (_) => Injector.instance<VideosBloc>()
        ..add(
          VideosEventFetched(),
        ),
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

    String videosName = '';
    if (context
        .read<AppBloc>()
        .state
        .locale == 'en') {
      videosName = videosEntity?.nameEn ?? '';
    } else {
      videosName = videosEntity?.nameTr ?? '';
    }
    return AppBar(
      title: Text(videosName,),
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
      // leading: CustomIconButton(
      //   onPressed: () {
      //     context.go(AppRouter.homePath);
      //   },
      //   icon: const SvgIcon(
      //     asset: AssetsIcons.arrowLeft,
      //     color: AppTheme.iconColor,
      //     size: AppDimensions.iconSizeMedium,
      //   ),
      // ),
    );
  }

  _buildBody(BuildContext context) {
    AppScale scale = AppScale(context);

    return BlocConsumer<VideosBloc, VideosState>(
      listenWhen: (current, previous) =>
      previous.videosStatus != current.videosStatus,
      listener: (context, state) async {
        if (state.videosStatus == VideosStatus.failure) {
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
        if (state.videosStatus == VideosStatus.loading) {
          return const Center(child: CustomCircularProgressIndicator());
        }
        if (state.videosStatus == VideosStatus.failure) {
          return Center(
            child: Text(
              AppLocalizations.of(
                context,
              )!.translate(state.failure.message ?? 'failure')!,
            ),
          );
        }
        if (state.videosStatus == VideosStatus.success) {
          return VideosBox(videosEntity: videosEntity!,);
        }
        return Container();
      },
    );
  }

}
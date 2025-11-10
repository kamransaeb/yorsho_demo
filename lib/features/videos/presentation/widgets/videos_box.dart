import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yorsho_mobile_branded_dev/core/constants/app_dimensions/app_dimensions.dart';
import 'package:yorsho_mobile_branded_dev/features/videos/presentation/widgets/videos_box_image.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/app_theme/app_theme.dart';
import '../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../entities/videos/videos_entity.dart';
import '../../../../widgets/svg_icon.dart';
import '../../../app/presentation/bloc/app_bloc.dart';

class VideosBox extends StatefulWidget {
  final VideosEntity videosEntity;

  const VideosBox({required this.videosEntity, super.key});

  @override
  State<VideosBox> createState() => _VideosBoxState();
}

class _VideosBoxState extends State<VideosBox> {
  TextEditingController videosNameController = TextEditingController();
  TextEditingController videosDescriptionController = TextEditingController();


  @override
  void didChangeDependencies() {
    if (context.read<AppBloc>().state.locale == 'tr') {
      videosDescriptionController.text = widget.videosEntity.descriptionTr;
      videosNameController.text = widget.videosEntity.nameTr;
    } else {
      videosDescriptionController.text = widget.videosEntity.descriptionEn;
      videosNameController.text = widget.videosEntity.nameEn;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: ()=>   (widget.videosEntity.videoUrl != null) ?
            context.push('${AppRouter.videosPath}/${AppRouter.videoPlayerPath}',
                extra: widget.videosEntity) : null,
            child: Stack(
              children: [
                VideosBoxImage(
                  height: scale.width,
                  width: scale.width,
                  imageUrl: widget.videosEntity.imageUrl,
                ),
                if (widget.videosEntity.imageUrl != null)
                  SizedBox(
                    height: scale.width,
                    width: scale.width,
                    child: Center(
                      child: Opacity(
                        opacity: 0.5,
                        child: SvgIcon(
                          asset: AssetsIcons.play,
                          color: AppTheme.whiteColor,
                          size: AppDimensions.iconSizeExtraExtraExtraLarge,
                        ),
                      ),
                    ),
                  ),

              ],
            ),
          ),
          SizedBox(height: scale.pagePadding / 2),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
            child: RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              text: TextSpan(
                text: videosNameController.text.trim(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(height: scale.pagePadding / 2),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: videosDescriptionController.text.trim(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
          SizedBox(height: scale.pagePadding),
        ],
      ),
    );
  }
}

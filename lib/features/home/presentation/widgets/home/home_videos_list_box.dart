import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yorsho_mobile_branded_dev/features/home/presentation/widgets/home/home_videos_list_box_image.dart';
import 'package:yorsho_mobile_branded_dev/widgets/svg_icon.dart';

import '../../../../../core/app_router/app_router.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../../entities/videos/videos_entity.dart';
import '../../../../app/presentation/bloc/app_bloc.dart';

class HomeVideosListBox extends StatelessWidget {
  final VideosEntity videosEntity;

  const HomeVideosListBox({required this.videosEntity, super.key});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    TextEditingController videosNameController = TextEditingController();
    TextEditingController videosDescriptionController = TextEditingController();


    if (context.read<AppBloc>().state.locale == 'tr') {
      videosDescriptionController.text = videosEntity.descriptionTr;
      videosNameController.text = videosEntity.nameTr;
    } else {
      videosDescriptionController.text = videosEntity.descriptionEn;
      videosNameController.text = videosEntity.nameEn;
    }

    return GestureDetector(
      onTap: () => context.push(AppRouter.videosPath, extra: videosEntity),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.greyColor3),

          borderRadius: BorderRadius.circular(AppDimensions.borderRadius / 2),
          color: AppTheme.whiteColor,
        ),
        margin: EdgeInsets.all(scale.pagePadding / 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                HomeVideosListBoxImage(
                  width: scale.width / 2,
                  height: scale.width / 2,
                  imageUrl: videosEntity.imageUrl,
                ),

                SizedBox(
                  width: scale.width / 2,
                  height: scale.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (videosEntity.free == false)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: Container()),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: scale.pagePadding / 4,
                                vertical: scale.pagePadding / 4,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: scale.pagePadding / 4,
                                vertical: scale.pagePadding / 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.whiteColor,
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.borderRadius * 10,
                                ),
                              ),
                              child: const SvgIcon(
                                asset: AssetsIcons.lock,
                                color: AppTheme.iconColor,
                                size: AppDimensions.iconSizeMedium,
                              ),
                            ),
                          ],
                        ),
                      Expanded(child: Container()),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(child: Container()),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: scale.pagePadding / 4,
                              vertical: scale.pagePadding / 4,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: scale.pagePadding / 4,
                              vertical: scale.pagePadding / 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.whiteColor,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.borderRadius * 10,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: scale.pagePadding / 4,
                                  ),
                                  child: Text(
                                    '${videosEntity.minutes ?? '--'} m',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleSmall,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                const SvgIcon(
                                  asset: AssetsIcons.time,
                                  color: AppTheme.iconColor,
                                  size: AppDimensions.iconSizeMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),




            Container(
              width: scale.width / 2,
              padding: EdgeInsets.only(
                top: scale.pagePadding / 4,
                left: scale.pagePadding / 4,
                right: scale.pagePadding / 4,
              ),
              child:

              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                    //  padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
                      child: RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: videosNameController.text.trim(),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            // Container(
            //   width: scale.width / 2,
            //   padding: EdgeInsets.only(
            //     left: scale.pagePadding / 4,
            //     right: scale.pagePadding / 4,
            //   ),
            //   child:
            //   Row(
            //     children: [
            //       Expanded(
            //         child: Container(
            //           alignment: Alignment.topLeft,
            //         //  padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
            //           child: RichText(
            //             maxLines: 1,
            //             overflow: TextOverflow.ellipsis,
            //             textAlign: TextAlign.start,
            //             text: TextSpan(
            //               text: videosDescriptionController.text.trim(),
            //               style: Theme.of(context).textTheme.bodySmall,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}

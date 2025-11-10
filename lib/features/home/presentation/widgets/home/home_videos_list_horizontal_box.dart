import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../../entities/videos/videos_entity.dart';
import '../../../../app/presentation/bloc/app_bloc.dart';
import '../../bloc/home/home_bloc.dart';
import 'home_videos_list_box.dart';

class HomeVideosListHorizontalBox extends StatelessWidget {
  final List<int> videosIndexList;
  final int videosCategoryIndex;

  const HomeVideosListHorizontalBox({
    required this.videosIndexList,
    required this.videosCategoryIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);
    String videosCategoryName = '';
    HomeBloc homeBloc = context.read<HomeBloc>();

    if (context.read<AppBloc>().state.locale == 'en') {
      videosCategoryName = homeBloc.state.videosCategoryListEnabled[videosCategoryIndex].nameEn;
    } else {
      videosCategoryName = homeBloc.state.videosCategoryListEnabled[videosCategoryIndex].nameTr;
    }

    return


    Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
              margin: EdgeInsets.only(top: scale.pagePadding/2, left: scale.pagePadding / 2, right: scale.pagePadding),
              child: Text(
                videosCategoryName,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: scale.pagePadding / 4),
          height: (scale.width / 2) + (scale.pagePadding / 2) + (scale.pagePadding / 2)
              + (Theme.of(context).textTheme.titleMedium!.fontSize! * 1.3) + (scale.pagePadding / 8),
              //+  (Theme.of(context).textTheme.bodySmall!.fontSize! * 1.3),
        child:
        ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),

          itemCount: videosIndexList.length,
          itemBuilder: (context, index) {
            VideosEntity videosEntity  = context.read<HomeBloc>().state.videosListEnabledByVideosCategoryIdList[videosIndexList[index]];
            return HomeVideosListBox(
              // key: UniqueKey(),
              videosEntity: videosEntity,
            );
          },
        ),
            ),
            ],

      );
  }

}
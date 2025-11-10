import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../widgets/svg_icon.dart';

class HomeVideosListBoxImage extends StatelessWidget {
  final double width;
  final double height;
  final String? imageUrl;
  final Color? borderColor;

  const HomeVideosListBoxImage({
    required this.width,
    required this.height,
    this.imageUrl,
    this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: (imageUrl == null)
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.borderRadius / 2),
                  topRight: Radius.circular(AppDimensions.borderRadius / 2),
                ),
                color: AppTheme.whiteColor,
              ),
              child: Center(
                child: SvgIcon(
                  asset: AssetsIcons.image,
                  color: AppTheme.greyColor3,
                  size: AppDimensions.iconSizeExtraExtraLarge,
                ),
              ),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl!,
              progressIndicatorBuilder: (context, url, progress) => Container(
                color: AppTheme.whiteColor,
                child: Center(
                  child: CustomCircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: AppTheme.whiteColor,
                child: Center(
                  child: SvgIcon(
                    asset: AssetsIcons.image,
                    color: AppTheme.greyColor3,
                    size: AppDimensions.iconSizeExtraExtraLarge,
                  ),
                ),
              ),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppDimensions.borderRadius / 2),
                    topRight: Radius.circular(AppDimensions.borderRadius / 2),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
    );
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../core/app_localization/app_localization.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../widgets/box_shadow.dart';
import '../../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../../widgets/buttons/custom_text_button.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../widgets/custom_linear_percent_indicator.dart';
import '../../../../../widgets/svg_icon.dart';
import '../../bloc/home_profile_photo/home_profile_photo_bloc.dart';

class HomeProfilePhotoForm extends StatelessWidget {
  final UserYorshoEntity userYorshoEntity;

  const HomeProfilePhotoForm({required this.userYorshoEntity, super.key});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
          child: _buildTop(context),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
            child: Center(child: _buildCenter(context)),
          ),
        ),
        _buildBottom(context),
      ],
    );
  }

  _buildTop(BuildContext context) {
    AppScale scale = AppScale(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomLinearPercentIndicator(percent: 4 / 5),
        Container(
          padding: EdgeInsets.only(top: scale.pagePadding),
          child: Text(
            AppLocalizations.of(context)!.translate('profile_photo')!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }

  _buildCenter(BuildContext context) {
    return BlocBuilder<HomeProfilePhotoBloc, HomeProfilePhotoState>(
      builder: (context, state) {
        if (state.homeProfilePhotoImageUploadStatus ==
            HomeProfilePhotoImageUploadStatus.loading) {
          return const Center(child: CustomCircularProgressIndicator());
        } else {
          return _buildCenterBody(context);
        }
      },
    );
  }

  _buildCenterBody(BuildContext context) {
    AppScale scale = AppScale(context);

    Image? imageFile = context.select(
      (HomeProfilePhotoBloc bloc) => bloc.state.profileImageFile,
    );

    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () => _selectImage(context),
              child: Container(
                width: scale.width / 2,
                height: scale.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.borderRadius * 10,
                  ),
                  border: imageFile == null
                      ? Border.all(
                          color: AppTheme.greyColor3,
                          width: AppDimensions.borderLineWidth,
                        )
                      : null,
                ),
                child: imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.borderRadius * 10,
                        ),
                        child: imageFile,
                      )
                    : Center(
                        child: SvgPicture.asset(
                          AssetsIcons.emptyAvatar,
                          color: AppTheme.greyColor3,
                          width: AppDimensions.iconSizeMedium * 4,
                          height: AppDimensions.iconSizeMedium * 4,
                        ),
                      ),
              ),
            ),
            SizedBox(height: scale.pagePadding / 2),
            CustomTextButton(
              onPressed: () => _selectImage(context),

              child: Text(
                imageFile == null
                    ? AppLocalizations.of(context)!.translate('add_image')!
                    : AppLocalizations.of(context)!.translate('edit_image')!,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: AppTheme.primaryColor),
                overflow: TextOverflow.ellipsis,
              ),

              //color: AppTheme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  _buildBottom(BuildContext context) {
    AppScale scale = AppScale(context);

    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: scale.pagePadding / 2),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [_buildSaveButton(context)],
        ),
      ),
    );
  }

  _buildSaveButton(BuildContext context) {
    AppScale scale = AppScale(context);

    return BlocBuilder<HomeProfilePhotoBloc, HomeProfilePhotoState>(
      builder: (context, state) {
        return (state.homeProfilePhotoStatus ==
                HomeProfilePhotoStatus.loading) //  .isInProgress
            ? Container(
                height: AppDimensions.buttonHeight,
                alignment: Alignment.center,
                child: const CustomCircularProgressIndicator(),
              )
            :
              // ElevatedButton(
              //   key:
              //   const Key('homeProfilePhotoForm_saveButton_elevatedButton'),
              //   style: ElevatedButton.styleFrom(
              //     elevation: 5,
              //     minimumSize: const Size.fromHeight(
              //         AppDimensions.elevatedButtonMinimumSize),
              //     shape: RoundedRectangleBorder(
              //       borderRadius:
              //       BorderRadius.circular(AppDimensions.borderRadius * 2),
              //     ),
              //     backgroundColor: AppTheme.primaryColor,
              //   ),
              //   onPressed: () => context
              //       .read<HomeProfilePhotoBloc>()
              //       .add(const HomeProfilePhotoEventProfileImageSaved()),
              //   child: Text(
              //     AppLocalizations.of(context)!.translate('next')!,
              //     style: Theme.of(context)
              //         .textTheme
              //         .titleSmall!
              //         .copyWith(color: AppTheme.whiteColor),
              //   ),
              // );
              Container(
                height: AppDimensions.buttonHeight,
                margin: EdgeInsets.only(
                  top: scale.pagePadding / 2,
                  bottom: scale.pagePadding / 2,
                  left: scale.pagePadding,
                  right: scale.pagePadding,
                ),
                alignment: Alignment.center,
                child: CustomElevatedButton(
                  color: AppTheme.primaryColor,
                  key: const Key(
                    'homeProfilePhotoForm_saveButton_elevatedButton',
                  ),
                  onPressed: () => context.read<HomeProfilePhotoBloc>().add(
                    const HomeProfilePhotoEventProfileImageSaved(),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.translate('next')!,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppTheme.whiteColor,
                    ),
                  ),
                ),
              );
      },
    );
  }

  List<Widget> _buildModalOptions(BuildContext context) {
    AppScale scale = AppScale(context);
    Image? imageFile = context
        .read<HomeProfilePhotoBloc>()
        .state
        .profileImageFile;
    List<Widget> modalOptions = [];

    modalOptions.add(
      Center(
        child: FractionallySizedBox(
          widthFactor: 0.25,
          child: Container(
            margin: EdgeInsets.only(bottom: scale.pagePadding / 2),
            child: Container(
              height: 5.0,
              decoration: const BoxDecoration(
                //color: theme.dividerColor,
                color: AppTheme.greyColor3,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.borderRadius),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    modalOptions.add(
      ListTile(
        //contentPadding: EdgeInsets.zero,
        leading: const SvgIcon(
          asset: AssetsIcons.camera,
          size: AppDimensions.iconSizeLarge,
        ),
        title: Text(
          AppLocalizations.of(context)!.translate('camera')!,
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: AppTheme.blackColor),
        ),
        onTap: () => _handleTakePhoto(context),
      ),
    );

    modalOptions.add(
      ListTile(
        leading: const SvgIcon(
          asset: AssetsIcons.gallery,
          size: AppDimensions.iconSizeLarge,
        ),

        title: Text(
          AppLocalizations.of(context)!.translate('gallery')!,
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: AppTheme.blackColor),
        ),
        onTap: () => _handleChooseFromGallery(context),
      ),
    );

    if (imageFile != null) {
      modalOptions.add(
        ListTile(
          leading: const SvgIcon(
            asset: AssetsIcons.delete,
            size: AppDimensions.iconSizeLarge,
          ),
          title: Text(
            AppLocalizations.of(context)!.translate('delete')!,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: AppTheme.blackColor),
          ),
          onTap: () => _handleDelete(context),
        ),
      );
    }
    return modalOptions;
  }

  Future<void> _selectImage(BuildContext parentContext) async {
    AppScale scale = AppScale(parentContext);

    List<Widget> modalOptions = _buildModalOptions(parentContext);

    showModalBottomSheet(
      context: parentContext,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(scale.pagePadding * 2),
          topRight: Radius.circular(scale.pagePadding * 2),
        ),
      ),
      builder: (context) {
        return AnimatedContainer(
          margin: EdgeInsets.only(
            bottom:
                MediaQuery.of(context).viewInsets.bottom +
                (Platform.isIOS ? scale.pagePadding : scale.pagePadding * 2),
          ),
          duration: const Duration(
            milliseconds: AppDimensions.bottomSheetTransitionDuration,
          ),
          padding: EdgeInsets.all(scale.pagePadding),
          child: Wrap(children: modalOptions),
        );
      },
    );
  }

  _handleTakePhoto(BuildContext context) async {
    context.read<HomeProfilePhotoBloc>().add(
      const HomeProfilePhotoEventProfileImageCameraSelected(),
    );
    Navigator.pop(context);
  }

  _handleChooseFromGallery(BuildContext context) async {
    context.read<HomeProfilePhotoBloc>().add(
      const HomeProfilePhotoEventProfileImageGallerySelected(),
    );
    Navigator.pop(context);
  }

  _handleDelete(BuildContext context) async {
    context.read<HomeProfilePhotoBloc>().add(
      const HomeProfilePhotoEventProfileImageDeleted(),
    );
    Navigator.pop(context);
  }
}

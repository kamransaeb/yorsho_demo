import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../../core/app_localization/app_localization.dart';
import '../../../../../core/app_router/app_router.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../widgets/box_shadow.dart';
import '../../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../../widgets/custom_linear_percent_indicator.dart';
import '../../bloc/home_gender/home_gender_bloc.dart';

class HomeGenderForm extends StatelessWidget {
  final UserYorshoEntity userYorshoEntity;

  const HomeGenderForm({required this.userYorshoEntity, super.key});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Column(
        children: [
    Container(
    padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
    child:
    _buildTop(context),
    ),
          Expanded(
            child:
    Container(
    padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
    child: Center(
              child: _buildCenter(context),
            ),
          ),),
          _buildBottom(context),
        ],

    );
  }

  _buildTop(BuildContext context) {
    AppScale scale = AppScale(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomLinearPercentIndicator(
          percent: 3 / 5,
        ),
        Container(
          padding: EdgeInsets.only(
            top: scale.pagePadding,
          ),
          child: Text(
            AppLocalizations.of(context)!.translate('gender')!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }

  _buildCenter(BuildContext context) {
    AppScale scale = AppScale(context);
    int gender = context.select((HomeGenderBloc bloc) => bloc.state.gender);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                splashColor: Colors.transparent,
                onTap: () => context.read<HomeGenderBloc>().add(
                      const HomeGenderEventGenderChanged(gender: 1),
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: scale.pagePadding * 3,
                      width: scale.pagePadding * 3,
                      child: SvgPicture.asset(
                        AssetsIcons.genderFemale,
                        color: gender == 1
                            ? AppTheme.primaryColor
                            : AppTheme.greyColor1,
                      ),
                    ),
                    SizedBox(
                      height: scale.pagePadding,
                    ),
                    Text(
                      AppLocalizations.of(context)!.translate('female')!,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: gender == 1
                                ? AppTheme.primaryColor
                                : AppTheme.greyColor1,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                splashFactory: NoSplash.splashFactory,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => context.read<HomeGenderBloc>().add(
                      const HomeGenderEventGenderChanged(gender: 0),
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: scale.pagePadding * 3,
                      width: scale.pagePadding * 3,
                      child: SvgPicture.asset(
                        AssetsIcons.genderMale,
                        color: gender == 0
                            ? AppTheme.primaryColor
                            : AppTheme.greyColor1,
                      ),
                    ),
                    SizedBox(
                      height: scale.pagePadding,
                    ),
                    Text(
                      AppLocalizations.of(context)!.translate('male')!,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: gender == 0
                                ? AppTheme.primaryColor
                                : AppTheme.greyColor1,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: scale.pagePadding * 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio<int>(
              overlayColor: WidgetStateProperty.all(
                Colors.transparent,
              ),
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              fillColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (gender == 2) {
                    return AppTheme.primaryColor;
                  } else {
                    return AppTheme
                        .greyColor1; // Defer to the widget's default.
                  }
                },
              ),

              activeColor: AppTheme.primaryColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: 2,

              groupValue: gender,
              onChanged: (newValue) {
                _handleRadioValueChange(context, newValue);
              },
            ),
            SizedBox(width: scale.pagePadding/2,),
            GestureDetector(
              onTap: () => _handleRadioValueChange(context, 2),
              child: Text(
                AppLocalizations.of(context)!.translate('gender_not_shared')!,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppTheme.greyColor1),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _handleRadioValueChange(BuildContext context, int? newValue) {
    context.read<HomeGenderBloc>().add(
          HomeGenderEventGenderChanged(
            gender: newValue!,
          ),
        );
  }

  _buildBottom(BuildContext context) {
    AppScale scale = AppScale(context);

    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(
        top: scale.pagePadding / 2,
      ),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  _buildSaveButton(BuildContext context) {
    // return ElevatedButton(
    //   key: const Key('homeGenderForm_saveButton_elevatedButton'),
    //   style: ElevatedButton.styleFrom(
    //     elevation: 5,
    //     minimumSize:
    //         const Size.fromHeight(AppDimensions.elevatedButtonMinimumSize),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(AppDimensions.borderRadius * 2),
    //     ),
    //     backgroundColor: AppTheme.primaryColor,
    //   ),
    //   onPressed: (context.select((HomeGenderBloc bloc) => bloc.state).gender ==
    //           -1)
    //       ? null
    //       : () => context.go(
    //           '${AppRouter.homeNameSurnamePath}/${AppRouter.homeBirthDatePath}/${AppRouter.homeGenderPath}/${AppRouter.homeProfilePhotoPath}',
    //           extra: context.read<HomeGenderBloc>().state.userYorshoEntity),
    //   child: Text(
    //     AppLocalizations.of(context)!.translate('next')!,
    //     style: Theme.of(context)
    //         .textTheme
    //         .titleSmall!
    //         .copyWith(color: AppTheme.whiteColor),
    //   ),
    // );

    AppScale scale = AppScale(context);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // boxShadow: [shadow()],
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.borderRadius * 2),
        ),
      ),
      height: AppDimensions.buttonHeight,
      margin: EdgeInsets.only(
        left: scale.pagePadding,
        right: scale.pagePadding,
        bottom: scale.pagePadding / 2,
        // bottom: _scale.pagePadding/2,
      ),
      child: CustomElevatedButton(
        color: AppTheme.primaryColor,
        key: const Key('homeGenderForm_saveButton_elevatedButton'),
        onPressed: (context
                    .select((HomeGenderBloc bloc) => bloc.state)
                    .gender ==
                -1)
            ? null
            : () => context.go(
                '${AppRouter.homeNameSurnamePath}/${AppRouter.homeBirthDatePath}/${AppRouter.homeGenderPath}/${AppRouter.homeProfilePhotoPath}',
                extra: context.read<HomeGenderBloc>().state.userYorshoEntity),
        child: Text(
          AppLocalizations.of(context)!.translate('next')!,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppTheme.whiteColor),
        ),
      ),
    );
  }
}

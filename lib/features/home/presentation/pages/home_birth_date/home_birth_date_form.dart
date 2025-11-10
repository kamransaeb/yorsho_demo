import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import '../../../../../core/app_localization/app_localization.dart';
import '../../../../../core/app_router/app_router.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../widgets/bottom_sheet/bottom_sheet.dart';
import '../../../../../widgets/box_shadow.dart';
import '../../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../../widgets/custom_linear_percent_indicator.dart';
import '../../bloc/home_birth_date/home_birth_date_bloc.dart';
import '../../widgets/home_birth_date/home_birth_date_cupertino_picker.dart';

class HomeBirthDateForm extends StatelessWidget {
  final UserYorshoEntity userYorshoEntity;

  const HomeBirthDateForm({required this.userYorshoEntity, super.key});

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
        const CustomLinearPercentIndicator(percent: 2 / 5),
        Container(
          padding: EdgeInsets.only(top: scale.pagePadding),
          child: Text(
            AppLocalizations.of(context)!.translate('birth_date')!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }

  _buildCenter(BuildContext context) {
    AppScale scale = AppScale(context);

    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${AppLocalizations.of(context)!.translate('date')!}:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () async {
                      return bottomSheet(
                        context,
                        BlocProvider.value(
                          value: context.read<HomeBirthDateBloc>(),
                          child: const HomeBirthDateCupertinoPicker(),
                        ),
                        scale.height / 3,
                      );
                    },
                    child: Container(
                      height: scale.pagePadding * 2,
                      //   width: planInfoDetailImageSize * 2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme.blackColor,
                          width: AppDimensions.borderLineWidth,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.borderRadius * 2,
                        ),
                        color: AppTheme.whiteColor,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                Jiffy.parseFromDateTime(
                                  context.select(
                                    (HomeBirthDateBloc bloc) =>
                                        bloc.state.birthDate!,
                                  ),
                                ).format(pattern: "do  MMMM  yyyy"),
                                // Jiffy.parseFromDateTime(registerViewModel.birthDate!).format(pattern: "do  MMMM  yyyy"),
                                //style: textStyle(context).headline4,
                                style: Theme.of(context).textTheme.titleSmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: scale.pagePadding),
                            child: const Icon(
                              Icons.expand_more,
                              size: AppDimensions.iconSizeMedium,
                              color: AppTheme.iconColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
          children: [_buildNextButton(context)],
        ),
      ),
    );
  }

  _buildNextButton(BuildContext context) {
    AppScale scale = AppScale(context);

    return Container(
      alignment: Alignment.center,

      height: AppDimensions.buttonHeight,
      margin: EdgeInsets.only(
        left: scale.pagePadding,
        right: scale.pagePadding,
        bottom: scale.pagePadding / 2,
        // bottom: _scale.pagePadding/2,
      ),
      child: CustomElevatedButton(
        color: AppTheme.primaryColor,
        key: const Key('homeBirthDateForm_nextButton_elevatedButton'),
        onPressed: () => context.go(
          '${AppRouter.homeNameSurnamePath}/${AppRouter.homeBirthDatePath}/${AppRouter.homeGenderPath}',
          extra: context.read<HomeBirthDateBloc>().state.userYorshoEntity,
        ),
        child: Text(
          AppLocalizations.of(context)!.translate('next')!,
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: AppTheme.whiteColor),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../../core/app_localization/app_localization.dart';
import '../../../../../core/app_router/app_router.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../widgets/box_shadow.dart';
import '../../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../../widgets/custom_linear_percent_indicator.dart';
import '../../bloc/home_name_surname/home_name_surname_bloc.dart';

class HomeNameSurnameForm extends StatelessWidget {
  final UserYorshoEntity userYorshoEntity;

  const HomeNameSurnameForm({required this.userYorshoEntity, super.key});

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
        const CustomLinearPercentIndicator(percent: 1 / 5),
        Container(
          padding: EdgeInsets.only(top: scale.pagePadding),
          child: Text(
            AppLocalizations.of(context)!.translate('name_and_surname')!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }

  _buildCenter(BuildContext context) {
    AppScale scale = AppScale(context);

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: SizedBox(child: Column(children: [_NameInput(), _SurnameInput()])),
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

    return Container(
      alignment: Alignment.center,
      height: AppDimensions.buttonHeight,
      margin: EdgeInsets.only(
        left: scale.pagePadding,
        right: scale.pagePadding,
        bottom: scale.pagePadding / 2,
        // bottom: _scale.pagePadding/2,
      ),
      child:

      CustomElevatedButton(
        color: AppTheme.primaryColor,
        key: const Key('homeNameSurnameForm_saveButton_elevatedButton'),

        onPressed:
            (context.select((HomeNameSurnameBloc bloc) => bloc.state).isValid)
            ? () => context.go(
                '${AppRouter.homeNameSurnamePath}/${AppRouter.homeBirthDatePath}',
                extra: context
                    .read<HomeNameSurnameBloc>()
                    .state
                    .userYorshoEntity,
              )
            : null,
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

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNameSurnameBloc, HomeNameSurnameState>(
      buildWhen: (previous, current) =>
          previous.userYorshoNameInput != current.userYorshoNameInput,
      builder: (context, state) {
        return TextField(
          textCapitalization: TextCapitalization.sentences,
          key: const Key('homeNameSurnameForm_nameInput_textField'),
          onChanged: (name) => context.read<HomeNameSurnameBloc>().add(
            HomeNameSurnameEventNameChanged(name: name),
          ),
          decoration: InputDecoration(
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.redColor,
                  width: AppDimensions.borderLineWidth),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.primaryColor,
                  width: AppDimensions.borderLineWidth),
            ),
            labelText: AppLocalizations.of(context)!.translate('name')!,
            labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.greyColor1),
            floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.blackColor),


            helperText: '',
            errorText: state.userYorshoNameInput.displayError != null
                ? AppLocalizations.of(context)!.translate('wrong_name')!
                : null,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        );
      },
    );
  }
}

class _SurnameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNameSurnameBloc, HomeNameSurnameState>(
      buildWhen: (previous, current) =>
          previous.userYorshoSurnameInput != current.userYorshoSurnameInput,
      builder: (context, state) {
        return TextField(
          textCapitalization: TextCapitalization.sentences,
          key: const Key('homeNameSurnameForm_surnameInput_textField'),
          onChanged: (surname) => context.read<HomeNameSurnameBloc>().add(
            HomeNameSurnameEventSurnameChanged(surname: surname),
          ),
          decoration: InputDecoration(
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.redColor,
                  width: AppDimensions.borderLineWidth),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.primaryColor,
                  width: AppDimensions.borderLineWidth),
            ),
            labelText: AppLocalizations.of(context)!.translate('surname')!,
            labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.greyColor1),
            floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.blackColor),

            helperText: '',
            errorText: state.userYorshoSurnameInput.displayError != null
                ? AppLocalizations.of(context)!.translate('wrong_surname')!
                : null,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        );
      },
    );
  }
}

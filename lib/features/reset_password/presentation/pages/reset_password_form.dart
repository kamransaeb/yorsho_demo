import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_localization/app_localization.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/app_scale/app_scale.dart';
import '../../../../core/app_theme/app_theme.dart';
import '../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../widgets/buttons/custom_text_button.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/locale_button.dart';
import '../cubit/reset_password_cubit.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
          child: const LocaleButton(),
        ),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: scale.pagePadding * 3),
                      child: SvgPicture.asset(
                        AssetsIcons.yorshoLogoBlack,
                        height: scale.pagePadding * 4,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: scale.pagePadding,
                      ),
                      child: _EmailInput(),
                    ),
                    SizedBox(height: scale.pagePadding / 2),
                    _ResetPasswordButton(),
                    SizedBox(height: scale.pagePadding / 2),
                    _GoBackToLoginPageButton(),
                    SizedBox(height: scale.pagePadding),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.userYorshoEmailInput != current.userYorshoEmailInput,
      builder: (context, state) {
        return TextField(
          key: const Key('resetPasswordForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<ResetPasswordCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.redColor,
                  width: AppDimensions.borderLineWidth),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.primaryColor,
                width: AppDimensions.borderLineWidth,
              ),
            ),
            labelText: AppLocalizations.of(context)!.translate('email')!,
            labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.greyColor1),
            floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.blackColor),
            helperText: '',
            errorText: state.userYorshoEmailInput.displayError != null
                ? AppLocalizations.of(context)!.translate('invalid_email')!
                : null,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        );
      },
    );
  }
}

class _ResetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return state.formzSubmissionStatus.isInProgress
            ? Container(
                height: AppDimensions.buttonHeight,
                alignment: Alignment.center,
                child: const CustomCircularProgressIndicator(),
              )
            : Container(
                alignment: Alignment.center,
                height: AppDimensions.buttonHeight,
                margin: EdgeInsets.only(
                  left: scale.pagePadding,
                  right: scale.pagePadding,
                ),
                child: CustomElevatedButton(
                  key: const Key('resetPasswordForm_login_raisedButton'),
                  color: AppTheme.primaryColor,
                  onPressed: state.isValid
                      ? () => context
                            .read<ResetPasswordCubit>()
                            .sendResetPassword()
                      : null,
                  child: Text(
                    AppLocalizations.of(context)!.translate('reset')!,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppTheme.whiteColor,
                    ),
                  ),
                ),
              );
      },
    );
  }
}

class _GoBackToLoginPageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextButton(
          key: const Key(
            'resetPasswordForm_goBackToLoginPageButton_TextButton',
          ),
          onPressed: () {
            context.go(AppRouter.loginPath);
          },
          child: Text(
            AppLocalizations.of(context)!.translate('go_back_to_login_page')!,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: AppTheme.primaryColor),
          ),
        ),
      ],
    );
  }
}

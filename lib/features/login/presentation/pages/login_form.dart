import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/app_localization/app_localization.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/app_scale/app_scale.dart';
import '../../../../core/app_theme/app_theme.dart';
import '../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../widgets/buttons/custom_outlined_button.dart';
import '../../../../widgets/buttons/custom_text_button.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/locale_button.dart';
import '../bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: scale.pagePadding),
          child: const LocaleButton(),
        ),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
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
                    margin: EdgeInsets.symmetric(horizontal: scale.pagePadding),
                    child: const _EmailInput(),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: scale.pagePadding),
                    child: const _PasswordInput(),
                  ),
                  SizedBox(height: scale.pagePadding / 2),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: scale.pagePadding),
                    child: const _LoginButton(),
                  ),
                  SizedBox(height: scale.pagePadding / 2),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: scale.pagePadding),
                    child: const _SignUpButton(),
                  ),
                  SizedBox(height: scale.pagePadding / 2),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: scale.pagePadding),
                    child: const _ResetPasswordButton(),
                  ),
                  SizedBox(height: scale.pagePadding),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailTextEditingController =
        TextEditingController();

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.userYorshoEmailInput != current.userYorshoEmailInput,
      builder: (context, state) {
        final currentEmailValue = state.userYorshoEmailInput.value;
        TextSelection previousEmailSelection =
            emailTextEditingController.selection;
        final emailEditValue = TextEditingValue(
          text: currentEmailValue,
          selection: previousEmailSelection,
        );
        emailTextEditingController.value = emailEditValue;

        return TextField(
          controller: emailTextEditingController,
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<LoginBloc>().add(
            LoginEventEmailChanged(email: email),
          ),
          //emailChanged(email),
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
                  width: AppDimensions.borderLineWidth),
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

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordTextEditingController =
        TextEditingController();

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.userYorshoPasswordInput != current.userYorshoPasswordInput,
      builder: (context, state) {
        final currentPasswordValue = state.userYorshoPasswordInput.value;
        TextSelection previousPasswordSelection =
            passwordTextEditingController.selection;
        final passwordEditValue = TextEditingValue(
          text: currentPasswordValue,
          selection: previousPasswordSelection,
        );
        passwordTextEditingController.value = passwordEditValue;

        return TextField(
          controller: passwordTextEditingController,
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) => context.read<LoginBloc>().add(
            LoginEventPasswordChanged(password: password),
          ),
          //passwordChanged(password),
          obscureText: true,
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
            labelText: AppLocalizations.of(context)!.translate('password')!,
            labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.greyColor1),
            floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.blackColor),
            helperText: '',
            errorText: state.userYorshoPasswordInput.displayError != null
                ? AppLocalizations.of(context)!.translate('wrong_password')!
                : null,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formzSubmissionStatus.isInProgress
            ? Container(
                height: AppDimensions.buttonHeight,
                alignment: Alignment.center,
                child:
                const CustomCircularProgressIndicator(),
              )
            : Container(
                alignment: Alignment.center,
                height: AppDimensions.buttonHeight,
                child: CustomElevatedButton(
                  key: const Key('loginForm_loginButton_elevatedButton'),
                  color: AppTheme.primaryColor,
                  onPressed: state.isValid
                      ? () =>
                            context.read<LoginBloc>().add(
                              const LoginEventSubmitted(),
                            ) //.logInWithEmailAndPassword()
                      : null,
                  child: Text(
                    AppLocalizations.of(context)!.translate('login')!,
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

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Container(
          alignment: Alignment.center,
          height: AppDimensions.buttonHeight,
          child: CustomOutlinedButton(
            outlineColor: AppTheme.iconColor,
            outlinedButtonKey: const Key(
              'loginForm_signUpButton_elevatedButton',
            ),
            onPressed: () {
              context.go('${AppRouter.loginPath}/${AppRouter.signUpPath}');
            },
            child: Text(
              AppLocalizations.of(context)!.translate('sign_up')!,
              style: Theme.of(
                context,
              ).textTheme.titleSmall,
            ),
          ),

    );
  }
}

class _ResetPasswordButton extends StatelessWidget {
  const _ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${AppLocalizations.of(context)!.translate('forgot_password')}?',
          style: Theme.of(context).textTheme.bodySmall!,
        ),
        SizedBox(width: scale.pagePadding / 2,),
        CustomTextButton(
          key: const Key('loginForm_resetPassword_TextButton'),
          onPressed: () {
            context.go('${AppRouter.loginPath}/${AppRouter.resetPasswordPath}');
          },
          child: Text(
            AppLocalizations.of(context)!.translate('reset')!,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: AppTheme.primaryColor),
          ),
        ),
      ],
    );
  }
}

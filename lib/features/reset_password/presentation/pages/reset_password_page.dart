import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:yorsho_mobile_branded_dev/features/reset_password/presentation/pages/reset_password_form.dart';
import '../../../../core/app_localization/app_localization.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/app_scale/app_scale.dart';
import '../../../../core/app_theme/app_theme.dart';
import '../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../injector/injector.dart';
import '../../../../widgets/buttons/custom_icon_button.dart';
import '../../../../widgets/svg_icon.dart';
import '../cubit/reset_password_cubit.dart';

class ResetPasswordPage extends StatelessWidget {

  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordCubit>(
      create: (context) => Injector.instance<ResetPasswordCubit>(),
      child:  _build(context),
    );
  }

  _build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          onPressed: () {
            context.go(AppRouter.loginPath);
          },
          icon: const SvgIcon(
            asset: AssetsIcons.arrowLeft,
            color: AppTheme.iconColor,
            size: AppDimensions.iconSizeMedium,
          ),
        ),
        title: Text(AppLocalizations.of(context)!.translate('reset_password')!),
      ),
      body: _buildMain(context),
    );
  }

  _buildMain(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) {
        return (previous.formzSubmissionStatus !=
            current.formzSubmissionStatus);
      },
      listener: (context, state) async {
        if (state.formzSubmissionStatus.isFailure) {
          await Flushbar(
            duration: const Duration(seconds: 3),
            title: AppLocalizations.of(context)!.translate('failure')!,
            message: AppLocalizations.of(context)!
                .translate(state.failure.message ?? 'failure_reset_password')!,
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        } else if (state.formzSubmissionStatus.isSuccess) {
          await Flushbar(
            duration: const Duration(seconds: 3),
            title: AppLocalizations.of(context)!.translate('success')!,
            message: AppLocalizations.of(context)!
                .translate('success_send_password_reset')!,
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
      },
      child: const ResetPasswordForm(),
    );
  }

}


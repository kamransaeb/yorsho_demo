import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_localization/app_localization.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../injector/injector.dart';
import '../bloc/login_bloc.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final Map? userCredentials;
  const LoginPage({this.userCredentials, super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider<LoginBloc>(
      create: (_) => Injector.instance<LoginBloc>()
        ..add(LoginEventFetched(userCredentials: userCredentials),),

      child:
      Builder(builder: (context) {
        return _build(context);
      },),

    );
  }

  _build(BuildContext context) {

    if (userCredentials != null) {
      context.read<LoginBloc>().add(
          LoginEventFetched(userCredentials: userCredentials));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('login')!),
      ),
      body: _buildMain(context),
    );
  }


  _buildMain(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
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
                .translate(state.failure.message ?? 'failure_login')!,
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        } else if (state.formzSubmissionStatus.isSuccess) {
          /// CHECK THIS ONE
          //context.go(AppRouter.homePath);
          context.go(AppRouter.appDirectorPath);
        }
      },
      child: const LoginForm(),
    );
  }
}

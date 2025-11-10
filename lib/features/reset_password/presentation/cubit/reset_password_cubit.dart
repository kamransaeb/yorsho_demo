import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../../../core/failure/failure.dart';
import '../../../../services/log_service/log_service.dart';
import '../../../../widgets/inputs/user_email_input.dart';
import '../../use_cases/reset_password_use_case.dart';
import '../../use_cases/reset_password_use_case_params.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  final LogService _logService;

  ResetPasswordCubit(
      {
      required ResetPasswordUseCase resetPasswordUseCase,
      required LogService logService})
      : _resetPasswordUseCase = resetPasswordUseCase,
        _logService = logService,
        super(const ResetPasswordState());

  void emailChanged(String value) {
    final userYorshoEmailInput = UserEmailInput.dirty(value);
    emit(
      state.copyWith(
        userYorshoEmailInput: userYorshoEmailInput,
        isValid: Formz.validate([
          userYorshoEmailInput,
        ]),
      ),
    );
  }

  Future<void> sendResetPassword() async {
    if (!state.isValid) return;
    emit(
      state.copyWith(
        formzSubmissionStatus: FormzSubmissionStatus.inProgress,
      ),
    );
    Either<Failure, void> result = await _resetPasswordUseCase(
        ResetPasswordUseCaseParams(email: state.userYorshoEmailInput.value));
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            formzSubmissionStatus: FormzSubmissionStatus.failure,
            failure: Failure(
              message: failure.message,
              status: failure.status,
            ),
          ),
        );
      },
      (data) {
        emit(state.copyWith(
          formzSubmissionStatus: FormzSubmissionStatus.success,
          failure: const Failure(),
        ));
      },
    );
  }


}

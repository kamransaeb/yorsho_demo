import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../../../core/failure/failure.dart';
import '../../../../services/log_service/log_service.dart';
import '../../../../widgets/inputs/user_email_input.dart';
import '../../../../widgets/inputs/user_password_input.dart';
import '../../use_cases/sign_up_use_case.dart';
import '../../use_cases/sign_up_use_case_params.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;
  final LogService _logService;

  SignUpCubit({
    required SignUpUseCase signUpUseCase,
    required LogService logService,
  })  : _signUpUseCase = signUpUseCase,
        _logService = logService,
        super(const SignUpState());

  void emailChanged(String value) {
    final userYogaSalaEmailInput = UserEmailInput.dirty(value);
    emit(
      state.copyWith(
        userYogaSalaEmailInput: userYogaSalaEmailInput,
        isValid: Formz.validate(
            [userYogaSalaEmailInput, state.userYogaSalaPasswordInput]),
      ),
    );
  }

  void passwordChanged(String value) {
    final userYogaSalaPasswordInput = UserPasswordInput.dirty(value);
    emit(
      state.copyWith(
        userYogaSalaPasswordInput: userYogaSalaPasswordInput,
        isValid: Formz.validate(
            [userYogaSalaPasswordInput, state.userYogaSalaEmailInput]),
      ),
    );
  }

  Future<void> signUpWithEmailAndPassword() async {
    if (!state.isValid) return;
    emit(
      state.copyWith(
        formzSubmissionStatus: FormzSubmissionStatus.inProgress,
      ),
    );

    Either<Failure, void> result = await _signUpUseCase(SignUpUseCaseParams(
        email: state.userYogaSalaEmailInput.value,
        password: state.userYogaSalaPasswordInput.value));
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
        emit(
          state.copyWith(
            formzSubmissionStatus: FormzSubmissionStatus.success,
            failure: const Failure(),
          ),
        );
      },
    );
  }
}

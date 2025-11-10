import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../../../core/constants/cache_client_keys/cache_client_keys.dart';
import '../../../../core/failure/failure.dart';
import '../../../../data/authentication/repositories/authentication_repository.dart';
import '../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../services/cache_client_service/cache_client_service.dart';
import '../../../../services/log_service/log_service.dart';
import '../../../../widgets/inputs/user_email_input.dart';
import '../../../../widgets/inputs/user_password_input.dart';
import '../../use_cases/login_use_case.dart';
import '../../use_cases/login_use_case_params.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final LogService _logService;
  final CacheClientService _cacheClientService;
  final AuthenticationRepository _authenticationRepository;

  LoginBloc({
    required LoginUseCase loginUseCase,
    required LogService logService,
    required CacheClientService cacheClientService,
    required AuthenticationRepository authenticationRepository,
  })  : _loginUseCase = loginUseCase,
        _logService = logService,
        _cacheClientService = cacheClientService,
        _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginEventEmailChanged>(_onLoginEventEmailChanged);
    on<LoginEventPasswordChanged>(_onLoginEventPasswordChanged);
    on<LoginEventFetched>(_onLoginEventFetched);
    on<LoginEventSubmitted>(_onLoginEventSubmitted);
  }

  // void emailChanged(String value) {
  //   final userYorshoEmailInput = UserEmailInput.dirty(value);
  //   emit(
  //     state.copyWith(
  //       userYorshoEmailInput: userYorshoEmailInput,
  //       isValid: Formz.validate([userYorshoEmailInput, state.userYorshoPasswordInput]),
  //     ),
  //   );
  // }

  // void passwordChanged(String value) {
  //   final userYorshoPasswordInput = UserPasswordInput.dirty(value);
  //   emit(
  //     state.copyWith(
  //       userYorshoPasswordInput: userYorshoPasswordInput,
  //       isValid: Formz.validate([userYorshoPasswordInput, state.userYorshoEmailInput]),
  //     ),
  //   );
  // }



  _onLoginEventEmailChanged(
      LoginEventEmailChanged event, Emitter<LoginState> emit) {
    final userYorshoEmailInput = UserEmailInput.dirty(event.email);
    emit(
      state.copyWith(
        userYorshoEmailInput: userYorshoEmailInput,
        isValid: Formz.validate([userYorshoEmailInput, state.userYorshoPasswordInput]),
      ),
    );
  }

  _onLoginEventPasswordChanged(
      LoginEventPasswordChanged event, Emitter<LoginState> emit) {
    final userYorshoPasswordInput = UserPasswordInput.dirty(event.password);
    emit(
      state.copyWith(
        userYorshoPasswordInput: userYorshoPasswordInput,
        isValid: Formz.validate([userYorshoPasswordInput, state.userYorshoEmailInput]),
      ),
    );
  }

  _onLoginEventFetched(
      LoginEventFetched event, Emitter<LoginState> emit) async {

    if (event.userCredentials == null) return;


    if (state.loginStatus == LoginStatus.redirect) return;

      final userYorshoEmailInput = UserEmailInput.dirty(
          event.userCredentials!['email'] as String);
      final userYorshoPasswordInput = UserPasswordInput.dirty(
          event.userCredentials!['password'] as String);

      emit(
        state.copyWith(
          loginStatus: LoginStatus.redirect,
          //userYorshoEntity: event.userYorshoEntity,
          //homeNameSurnameStatus: HomeNameSurnameStatus.success,
          userYorshoEmailInput: userYorshoEmailInput,
          userYorshoPasswordInput: userYorshoPasswordInput,
          isValid: Formz.validate([
            userYorshoEmailInput,
            userYorshoPasswordInput,
          ]),
        ),
      );

  }


 _onLoginEventSubmitted(LoginEventSubmitted event, Emitter<LoginState> emit) async {

    if (!state.isValid) return;
    emit(
      state.copyWith(
        formzSubmissionStatus: FormzSubmissionStatus.inProgress,
      ),
    );

    Either<Failure, void> result = await _loginUseCase(LoginUseCaseParams(
        email: state.userYorshoEmailInput.value, password: state.userYorshoPasswordInput.value));
    await result.fold(
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
      (data) async {
        bool result = await _authenticationRepository.isLoggedIn();

        if (result) {
          UserYorshoEntity? userYorshoEntity = _cacheClientService.read<
              UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey);
          emit(
            state.copyWith(
              formzSubmissionStatus: FormzSubmissionStatus.success,
              failure: const Failure(),
              userYorshoEntity: userYorshoEntity,
            ),
          );
        } else {
          emit(
            state.copyWith(
              formzSubmissionStatus: FormzSubmissionStatus.failure,
              failure: const Failure(),
            ),
          );
        }
      },
    );
  }






}

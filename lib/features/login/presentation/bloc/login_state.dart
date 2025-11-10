part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure , redirect}

class LoginState extends Equatable {

  final Failure failure;
  final LoginStatus loginStatus;
  final UserEmailInput userYorshoEmailInput;
  final UserPasswordInput userYorshoPasswordInput;
  final FormzSubmissionStatus formzSubmissionStatus;
  final UserYorshoEntity userYorshoEntity;
  final bool isValid;

  const LoginState({
    this.userYorshoEmailInput = const UserEmailInput.pure(),
    this.userYorshoPasswordInput = const UserPasswordInput.pure(),
    this.formzSubmissionStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.loginStatus = LoginStatus.initial,
    this.failure = const Failure(),
    this.userYorshoEntity = UserYorshoEntity.empty,
  });

  @override
  List<Object?> get props => [userYorshoEmailInput, userYorshoPasswordInput, formzSubmissionStatus, isValid, loginStatus, failure, userYorshoEntity];

//<editor-fold desc="Data Methods">

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginState &&
          runtimeType == other.runtimeType &&
          failure == other.failure &&
          loginStatus == other.loginStatus &&
          userYorshoEmailInput == other.userYorshoEmailInput &&
          userYorshoPasswordInput == other.userYorshoPasswordInput &&
          formzSubmissionStatus == other.formzSubmissionStatus &&
          userYorshoEntity == other.userYorshoEntity &&
          isValid == other.isValid);

  @override
  int get hashCode =>
      failure.hashCode ^
      loginStatus.hashCode ^
      userYorshoEmailInput.hashCode ^
      userYorshoPasswordInput.hashCode ^
      formzSubmissionStatus.hashCode ^
      userYorshoEntity.hashCode ^
      isValid.hashCode;

  @override
  String toString() {
    return 'LoginState{' +
        ' failure: $failure,' +
        ' loginStatus: $loginStatus,' +
        ' userYorshoEmailInput: $userYorshoEmailInput,' +
        ' userYorshoPasswordInput: $userYorshoPasswordInput,' +
        ' formzSubmissionStatus: $formzSubmissionStatus,' +
        ' userYorshoEntity: $userYorshoEntity,' +
        ' isValid: $isValid,' +
        '}';
  }

  LoginState copyWith({
    Failure? failure,
    LoginStatus? loginStatus,
    UserEmailInput? userYorshoEmailInput,
    UserPasswordInput? userYorshoPasswordInput,
    FormzSubmissionStatus? formzSubmissionStatus,
    UserYorshoEntity? userYorshoEntity,
    bool? isValid,
  }) {
    return LoginState(
      failure: failure ?? this.failure,
      loginStatus: loginStatus ?? this.loginStatus,
      userYorshoEmailInput: userYorshoEmailInput ?? this.userYorshoEmailInput,
      userYorshoPasswordInput: userYorshoPasswordInput ?? this.userYorshoPasswordInput,
      formzSubmissionStatus: formzSubmissionStatus ?? this.formzSubmissionStatus,
      userYorshoEntity: userYorshoEntity ?? this.userYorshoEntity,
      isValid: isValid ?? this.isValid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'failure': this.failure,
      'loginStatus': this.loginStatus,
      'userYorshoEmailInput': this.userYorshoEmailInput,
      'userYorshoPasswordInput': this.userYorshoPasswordInput,
      'formzSubmissionStatus': this.formzSubmissionStatus,
      'userYorshoEntity': this.userYorshoEntity,
      'isValid': this.isValid,
    };
  }

  factory LoginState.fromMap(Map<String, dynamic> map) {
    return LoginState(
      failure: map['failure'] as Failure,
      loginStatus: map['loginStatus'] as LoginStatus,
      userYorshoEmailInput: map['userYorshoEmailInput'] as UserEmailInput,
      userYorshoPasswordInput: map['userYorshoPasswordInput'] as UserPasswordInput,
      formzSubmissionStatus: map['formzSubmissionStatus'] as FormzSubmissionStatus,
      userYorshoEntity: map['userYorshoEntity'] as UserYorshoEntity,
      isValid: map['isValid'] as bool,
    );
  }

//</editor-fold>
}
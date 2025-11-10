part of 'sign_up_cubit.dart';

enum SignUpStatus { initial, loading, success, failure }

class SignUpState extends Equatable {

  final Failure failure;
  final SignUpStatus signUpStatus;
  final UserEmailInput userYogaSalaEmailInput;
  final UserPasswordInput userYogaSalaPasswordInput;
  final FormzSubmissionStatus formzSubmissionStatus;
  final bool isValid;

  const SignUpState({
    this.userYogaSalaEmailInput = const UserEmailInput.pure(),
    this.userYogaSalaPasswordInput = const UserPasswordInput.pure(),
    this.formzSubmissionStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.signUpStatus = SignUpStatus.initial,
    this.failure = const Failure(),
  });

  @override
  List<Object?> get props => [userYogaSalaEmailInput, userYogaSalaPasswordInput, formzSubmissionStatus, isValid, signUpStatus, failure];

//<editor-fold desc="Data Methods">

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignUpState &&
          runtimeType == other.runtimeType &&
          failure == other.failure &&
          signUpStatus == other.signUpStatus &&
          userYogaSalaEmailInput == other.userYogaSalaEmailInput &&
          userYogaSalaPasswordInput == other.userYogaSalaPasswordInput &&
          formzSubmissionStatus == other.formzSubmissionStatus &&
          isValid == other.isValid);

  @override
  int get hashCode =>
      failure.hashCode ^
      signUpStatus.hashCode ^
      userYogaSalaEmailInput.hashCode ^
      userYogaSalaPasswordInput.hashCode ^
      formzSubmissionStatus.hashCode ^
      isValid.hashCode;

  @override
  String toString() {
    return 'LoginState{' +
        ' failure: $failure,' +
        ' signUpStatus: $signUpStatus,' +
        ' userYogaSalaEmailInput: $userYogaSalaEmailInput,' +
        ' userYogaSalaPasswordInput: $userYogaSalaPasswordInput,' +
        ' formzSubmissionStatus: $formzSubmissionStatus,' +
        ' isValid: $isValid,' +
        '}';
  }

  SignUpState copyWith({
    Failure? failure,
    SignUpStatus? signUpStatus,
    UserEmailInput? userYogaSalaEmailInput,
    UserPasswordInput? userYogaSalaPasswordInput,
    FormzSubmissionStatus? formzSubmissionStatus,
    bool? isValid,
  }) {
    return SignUpState(
      failure: failure ?? this.failure,
      signUpStatus: signUpStatus ?? this.signUpStatus,
      userYogaSalaEmailInput: userYogaSalaEmailInput ?? this.userYogaSalaEmailInput,
      userYogaSalaPasswordInput: userYogaSalaPasswordInput ?? this.userYogaSalaPasswordInput,
      formzSubmissionStatus:
          formzSubmissionStatus ?? this.formzSubmissionStatus,
      isValid: isValid ?? this.isValid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'failure': this.failure,
      'signUpStatus': this.signUpStatus,
      'userYogaSalaEmailInput': this.userYogaSalaEmailInput,
      'userYogaSalaPasswordInput': this.userYogaSalaPasswordInput,
      'formzSubmissionStatus': this.formzSubmissionStatus,
      'isValid': this.isValid,
    };
  }

  factory SignUpState.fromMap(Map<String, dynamic> map) {
    return SignUpState(
      failure: map['failure'] as Failure,
      signUpStatus: map['signUpStatus'] as SignUpStatus,
      userYogaSalaEmailInput: map['userYogaSalaEmailInput'] as UserEmailInput,
      userYogaSalaPasswordInput: map['userYogaSalaPasswordInput'] as UserPasswordInput,
      formzSubmissionStatus:
          map['formzSubmissionStatus'] as FormzSubmissionStatus,
      isValid: map['isValid'] as bool,
    );
  }

//</editor-fold>
}
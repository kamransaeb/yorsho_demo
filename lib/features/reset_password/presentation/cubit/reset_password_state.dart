part of 'reset_password_cubit.dart';

enum ResetPasswordStatus { initial, loading, success, failure }

class ResetPasswordState extends Equatable {

  final UserEmailInput userYorshoEmailInput;
  final FormzSubmissionStatus formzSubmissionStatus;
  final bool isValid;
  final ResetPasswordStatus resetPasswordStatus;
  final Failure failure;


  const ResetPasswordState({
    this.userYorshoEmailInput = const UserEmailInput.pure(),
    this.formzSubmissionStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.resetPasswordStatus = ResetPasswordStatus.initial,
    this.failure = const Failure(),
  });

  @override
  List<Object?> get props => [userYorshoEmailInput, formzSubmissionStatus, isValid, resetPasswordStatus, failure];

//<editor-fold desc="Data Methods">

//   @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ResetPasswordState &&
              runtimeType == other.runtimeType &&
              userYorshoEmailInput == other.userYorshoEmailInput &&
              formzSubmissionStatus == other.formzSubmissionStatus &&
              isValid == other.isValid &&
              resetPasswordStatus == other.resetPasswordStatus &&
              failure == other.failure
          );


  @override
  int get hashCode =>
      userYorshoEmailInput.hashCode ^
      formzSubmissionStatus.hashCode ^
      isValid.hashCode ^
      resetPasswordStatus.hashCode ^
      failure.hashCode;


  @override
  String toString() {
    return 'ResetPasswordState{' +
        ' userYorshoEmailInput: $userYorshoEmailInput,' +
        ' formzSubmissionStatus: $formzSubmissionStatus,' +
        ' isValid: $isValid,' +
        ' resetPasswordStatus: $resetPasswordStatus,' +
        ' failure: $failure,' +
        '}';
  }


  ResetPasswordState copyWith({
    UserEmailInput? userYorshoEmailInput,
    FormzSubmissionStatus? formzSubmissionStatus,
    bool? isValid,
    ResetPasswordStatus? resetPasswordStatus,
    Failure? failure,
  }) {
    return ResetPasswordState(
      userYorshoEmailInput: userYorshoEmailInput ?? this.userYorshoEmailInput,
      formzSubmissionStatus: formzSubmissionStatus ??
          this.formzSubmissionStatus,
      isValid: isValid ?? this.isValid,
      resetPasswordStatus: resetPasswordStatus ?? this.resetPasswordStatus,
      failure: failure ?? this.failure,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'userYorshoEmailInput': this.userYorshoEmailInput,
      'formzSubmissionStatus': this.formzSubmissionStatus,
      'isValid': this.isValid,
      'resetPasswordStatus': this.resetPasswordStatus,
      'failure': this.failure,
    };
  }

  factory ResetPasswordState.fromMap(Map<String, dynamic> map) {
    return ResetPasswordState(
      userYorshoEmailInput: map['userYorshoEmailInput'] as UserEmailInput,
      formzSubmissionStatus: map['formzSubmissionStatus'] as FormzSubmissionStatus,
      isValid: map['isValid'] as bool,
      resetPasswordStatus: map['resetPasswordStatus'] as ResetPasswordStatus,
      failure: map['failure'] as Failure,
    );
  }


  //</editor-fold>

}

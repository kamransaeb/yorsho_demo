part of 'home_name_surname_bloc.dart';

enum HomeNameSurnameStatus { initial, loading, success, failure }

class HomeNameSurnameState extends Equatable {
  final HomeNameSurnameStatus homeNameSurnameStatus;
  final NameInput userYorshoNameInput;
  final NameInput userYorshoSurnameInput;
  final FormzSubmissionStatus formzSubmissionStatus;
  final bool isValid;
  final UserYorshoEntity userYorshoEntity;

  @override
  List<Object?> get props => [homeNameSurnameStatus, userYorshoNameInput, userYorshoSurnameInput, formzSubmissionStatus, isValid, userYorshoEntity,];

//<editor-fold desc="Data Methods">
  const HomeNameSurnameState({
    this.homeNameSurnameStatus = HomeNameSurnameStatus.initial,
    this.userYorshoNameInput = const NameInput.pure(),
    this.userYorshoSurnameInput = const NameInput.pure(),
    this.formzSubmissionStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    required this.userYorshoEntity,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeNameSurnameState &&
          runtimeType == other.runtimeType &&
          homeNameSurnameStatus == other.homeNameSurnameStatus &&
          userYorshoNameInput == other.userYorshoNameInput &&
          userYorshoSurnameInput == other.userYorshoSurnameInput &&
          formzSubmissionStatus == other.formzSubmissionStatus &&
          isValid == other.isValid &&
          userYorshoEntity == other.userYorshoEntity);

  @override
  int get hashCode =>
      homeNameSurnameStatus.hashCode ^
      userYorshoNameInput.hashCode ^
      userYorshoSurnameInput.hashCode ^
      formzSubmissionStatus.hashCode ^
      isValid.hashCode ^
      userYorshoEntity.hashCode;

  @override
  String toString() {
    return 'HomeNameSurnameState{' +
        ' homeNameSurnameStatus: $homeNameSurnameStatus,' +
        ' userYorshoNameInput: $userYorshoNameInput,' +
        ' userYorshoSurnameInput: $userYorshoSurnameInput,' +
        ' formzSubmissionStatus: $formzSubmissionStatus,' +
        ' isValid: $isValid,' +
        ' userYorshoEntity: $userYorshoEntity,' +
        '}';
  }

  HomeNameSurnameState copyWith({
    HomeNameSurnameStatus? homeNameSurnameStatus,
    NameInput? userYorshoNameInput,
    NameInput? userYorshoSurnameInput,
    FormzSubmissionStatus? formzSubmissionStatus,
    bool? isValid,
    UserYorshoEntity? userYorshoEntity,
  }) {
    return HomeNameSurnameState(
      homeNameSurnameStatus:
          homeNameSurnameStatus ?? this.homeNameSurnameStatus,
      userYorshoNameInput:
          userYorshoNameInput ?? this.userYorshoNameInput,
      userYorshoSurnameInput:
          userYorshoSurnameInput ?? this.userYorshoSurnameInput,
      formzSubmissionStatus:
          formzSubmissionStatus ?? this.formzSubmissionStatus,
      isValid: isValid ?? this.isValid,
      userYorshoEntity: userYorshoEntity ?? this.userYorshoEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'homeNameSurnameStatus': this.homeNameSurnameStatus,
      'userYorshoNameInput': this.userYorshoNameInput,
      'userYorshoSurnameInput': this.userYorshoSurnameInput,
      'formzSubmissionStatus': this.formzSubmissionStatus,
      'isValid': this.isValid,
      'userYorshoEntity': this.userYorshoEntity,
    };
  }

  factory HomeNameSurnameState.fromMap(Map<String, dynamic> map) {
    return HomeNameSurnameState(
      homeNameSurnameStatus:
          map['homeNameSurnameStatus'] as HomeNameSurnameStatus,
      userYorshoNameInput: map['userYorshoNameInput'] as NameInput,
      userYorshoSurnameInput: map['userYorshoSurnameInput'] as NameInput,
      formzSubmissionStatus:
          map['formzSubmissionStatus'] as FormzSubmissionStatus,
      isValid: map['isValid'] as bool,
      userYorshoEntity: map['userYorshoEntity'] as UserYorshoEntity,
    );
  }

//</editor-fold>
}

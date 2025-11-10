part of 'home_birth_date_bloc.dart';

enum HomeBirthDateStatus { initial, loading, success, failure }

class HomeBirthDateState extends Equatable {
  final HomeBirthDateStatus homeBirthDateStatus;
  final DateTime? birthDate;
  final UserYorshoEntity userYorshoEntity;

  @override
  List<Object?> get props => [homeBirthDateStatus, birthDate, userYorshoEntity,];

//<editor-fold desc="Data Methods">
  const HomeBirthDateState({
    this.homeBirthDateStatus = HomeBirthDateStatus.initial,
    this.birthDate,
    required this.userYorshoEntity,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeBirthDateState &&
          runtimeType == other.runtimeType &&
          homeBirthDateStatus == other.homeBirthDateStatus &&
          birthDate == other.birthDate &&
          userYorshoEntity == other.userYorshoEntity);

  @override
  int get hashCode =>
      homeBirthDateStatus.hashCode ^
      birthDate.hashCode ^
      userYorshoEntity.hashCode;

  @override
  String toString() {
    return 'HomeBirthDateState{' +
        ' homeBirthDateStatus: $homeBirthDateStatus,' +
        ' birthDate: $birthDate,' +
        ' userYorshoEntity: $userYorshoEntity,' +
        '}';
  }

  HomeBirthDateState copyWith({
    HomeBirthDateStatus? homeBirthDateStatus,
    DateTime? birthDate,
    UserYorshoEntity? userYorshoEntity,
  }) {
    return HomeBirthDateState(
      homeBirthDateStatus: homeBirthDateStatus ?? this.homeBirthDateStatus,
      birthDate: birthDate ?? this.birthDate,
      userYorshoEntity: userYorshoEntity ?? this.userYorshoEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'homeBirthDateStatus': this.homeBirthDateStatus,
      'birthDate': this.birthDate,
      'userYorshoEntity': this.userYorshoEntity,
    };
  }

  factory HomeBirthDateState.fromMap(Map<String, dynamic> map) {
    return HomeBirthDateState(
      homeBirthDateStatus: map['homeBirthDateStatus'] as HomeBirthDateStatus,
      birthDate: map['birthDate'] as DateTime,
      userYorshoEntity: map['userYorshoEntity'] as UserYorshoEntity,
    );
  }

//</editor-fold>
}

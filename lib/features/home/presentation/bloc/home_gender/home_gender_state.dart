part of 'home_gender_bloc.dart';

enum HomeGenderStatus { initial, loading, success, failure }

class HomeGenderState extends Equatable {
  final HomeGenderStatus homeGenderStatus;
  final int gender;
  final UserYorshoEntity userYorshoEntity;

  @override
  List<Object?> get props => [homeGenderStatus, gender, userYorshoEntity,];

//<editor-fold desc="Data Methods">
  const HomeGenderState({
    this.homeGenderStatus = HomeGenderStatus.initial,
    required this.gender,
    required this.userYorshoEntity,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeGenderState &&
          runtimeType == other.runtimeType &&
          homeGenderStatus == other.homeGenderStatus &&
          gender == other.gender &&
          userYorshoEntity == other.userYorshoEntity);

  @override
  int get hashCode =>
      homeGenderStatus.hashCode ^ gender.hashCode ^ userYorshoEntity.hashCode;

  @override
  String toString() {
    return 'HomeGenderState{' +
        ' homeGenderStatus: $homeGenderStatus,' +
        ' gender: $gender,' +
        ' userYorshoEntity: $userYorshoEntity,' +
        '}';
  }

  HomeGenderState copyWith({
    HomeGenderStatus? homeGenderStatus,
    int? gender,
    UserYorshoEntity? userYorshoEntity,
  }) {
    return HomeGenderState(
      homeGenderStatus: homeGenderStatus ?? this.homeGenderStatus,
      gender: gender ?? this.gender,
      userYorshoEntity: userYorshoEntity ?? this.userYorshoEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'homeGenderStatus': this.homeGenderStatus,
      'gender': this.gender,
      'userYorshoEntity': this.userYorshoEntity,
    };
  }

  factory HomeGenderState.fromMap(Map<String, dynamic> map) {
    return HomeGenderState(
      homeGenderStatus: map['homeGenderStatus'] as HomeGenderStatus,
      gender: map['gender'] as int,
      userYorshoEntity: map['userYorshoEntity'] as UserYorshoEntity,
    );
  }

//</editor-fold>
}

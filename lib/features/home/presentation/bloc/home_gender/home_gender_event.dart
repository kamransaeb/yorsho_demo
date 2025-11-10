part of 'home_gender_bloc.dart';

abstract class HomeGenderEvent extends Equatable {
  const HomeGenderEvent();

  @override
  List<Object?> get props => [];
}

final class HomeGenderEventFetched extends HomeGenderEvent {
  final UserYorshoEntity userYorshoEntity;
  const HomeGenderEventFetched({required this.userYorshoEntity});
}

final class HomeGenderEventGenderChanged extends HomeGenderEvent {
  final int gender;
  const HomeGenderEventGenderChanged({required this.gender});

  @override
  List<Object?> get props => [gender];
}
part of 'home_birth_date_bloc.dart';

abstract class HomeBirthDateEvent extends Equatable {
  const HomeBirthDateEvent();

  @override
  List<Object?> get props => [];
}

final class HomeBirthDateEventFetched extends HomeBirthDateEvent {
  final UserYorshoEntity userYorshoEntity;
  const HomeBirthDateEventFetched({required this.userYorshoEntity});
}

final class HomeBirthDateEventBirthDateChanged extends HomeBirthDateEvent {
  final DateTime birthDate;
  const HomeBirthDateEventBirthDateChanged({required this.birthDate});

  @override
  List<Object?> get props => [birthDate];
}
part of 'home_name_surname_bloc.dart';


abstract class HomeNameSurnameEvent extends Equatable {
  const HomeNameSurnameEvent();

  @override
  List<Object?> get props => [];
}

final class HomeNameSurnameEventFetched extends HomeNameSurnameEvent {
  final UserYorshoEntity userYorshoEntity;
  const HomeNameSurnameEventFetched({required this.userYorshoEntity});
}

final class HomeNameSurnameEventNameChanged extends HomeNameSurnameEvent {
  final String name;
  const HomeNameSurnameEventNameChanged({required this.name});

  @override
  List<Object?> get props => [name];
}

final class HomeNameSurnameEventSurnameChanged extends HomeNameSurnameEvent {
  final String surname;
  const HomeNameSurnameEventSurnameChanged({required this.surname});

  @override
  List<Object?> get props => [surname];
}
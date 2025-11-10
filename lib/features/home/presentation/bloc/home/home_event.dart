part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class HomeEventFetched extends HomeEvent {
  const HomeEventFetched();
}

final class _HomeEventUserReload extends HomeEvent {
  final UserYorshoEntity userYorshoEntityCached;
  const _HomeEventUserReload({required this.userYorshoEntityCached});

  @override
  List<Object?> get props => [userYorshoEntityCached];

}

class HomeEventLocaleChanged extends HomeEvent {
  final String locale;
  const HomeEventLocaleChanged({required this.locale});

  @override
  List<Object?> get props => [locale];
}
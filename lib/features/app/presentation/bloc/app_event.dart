part of 'app_bloc.dart';


abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppEventLocaleChanged extends AppEvent {
  final String locale;
  const AppEventLocaleChanged({required this.locale});

  @override
  List<Object?> get props => [locale];
}

class AppEventFirstUseDisabled extends AppEvent {
  const AppEventFirstUseDisabled();
}

class AppEventLoaded extends AppEvent {
  const AppEventLoaded();
}

class _AppEventUserChanged extends AppEvent {
  final MyUser myUser;

  const _AppEventUserChanged(
      this.myUser,
      );

  @override
  List<Object?> get props => [myUser];
}

class AppEventUserProfileChanged extends AppEvent {
  const AppEventUserProfileChanged();
}

class AppEventLogOutRequested extends AppEvent {
  const AppEventLogOutRequested();
}

class AppEventDeleteAccountRequested extends AppEvent {
  const AppEventDeleteAccountRequested();
}
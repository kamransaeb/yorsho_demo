part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

final class LoginEventFetched extends LoginEvent {
  final Map? userCredentials;
  const LoginEventFetched({required this.userCredentials});

  @override
  List<Object?> get props => [userCredentials];
}

final class LoginEventEmailChanged extends LoginEvent {
  final String email;
  const LoginEventEmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

final class LoginEventPasswordChanged extends LoginEvent {
  final String password;
  const LoginEventPasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

final class LoginEventSubmitted extends LoginEvent {
  const LoginEventSubmitted();
}

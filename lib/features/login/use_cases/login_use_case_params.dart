import 'package:equatable/equatable.dart';

class LoginUseCaseParams extends Equatable {
  final String email;
  final String password;

  const LoginUseCaseParams({
    required this.email, required this.password,
});

  @override
  List<Object?> get props => [email, password];
}
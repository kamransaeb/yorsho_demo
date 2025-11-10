import 'package:equatable/equatable.dart';

class SignUpUseCaseParams extends Equatable {
  final String email;
  final String password;

  const SignUpUseCaseParams({
    required this.email, required this.password,
});

  @override
  List<Object?> get props => [email, password];
}
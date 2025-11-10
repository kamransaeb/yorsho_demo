import 'package:equatable/equatable.dart';

class ResetPasswordUseCaseParams extends Equatable {
    final String email;
    const ResetPasswordUseCaseParams({required this.email});

    @override
    List<Object?> get props => [email];
}
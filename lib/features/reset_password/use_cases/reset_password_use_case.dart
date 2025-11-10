import 'dart:async';

import 'package:yorsho_mobile_branded_dev/features/reset_password/use_cases/reset_password_use_case_params.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/failure/failure.dart';
import '../../../data/authentication/repositories/authentication_repository.dart';

class ResetPasswordUseCase
    implements BaseUseCase<void, ResetPasswordUseCaseParams> {
  final AuthenticationRepository _authenticationRepository;

  const ResetPasswordUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  FutureOr<Either<Failure, void>> call(ResetPasswordUseCaseParams params) {
    return _authenticationRepository.sendPasswordResetEmail(
        email: params.email);
  }
}

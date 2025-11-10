import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:yorsho_mobile_branded_dev/features/sign_up/use_cases/sign_up_use_case_params.dart';


import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/failure/failure.dart';
import '../../../data/authentication/repositories/authentication_repository.dart';

class SignUpUseCase implements BaseUseCase<void, SignUpUseCaseParams> {

  final AuthenticationRepository _authenticationRepository;

  const SignUpUseCase({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository;
  
  @override
  FutureOr<Either<Failure, void>> call(SignUpUseCaseParams params) {
    return _authenticationRepository.signUpWithEmailAndPassword(email: params.email, password: params.password);
  }
  
}
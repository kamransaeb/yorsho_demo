import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/failure/failure.dart';
import '../../../data/authentication/repositories/authentication_repository.dart';
import '../../../data/user_yorsho/repositories/user_basket_repository.dart';
import '../../../entities/user_yorsho/user_yorsho_entity.dart';
import 'complete_user_yorsho_use_case_params.dart';

class CompleteUserYorshoUseCase implements BaseUseCase<UserYorshoEntity, CompleteUserYorshoUseCaseParams> {

  final AuthenticationRepository _authenticationRepository;
  final UserYorshoRepository _userYorshoRepository;

  const CompleteUserYorshoUseCase({
    required UserYorshoRepository userYorshoRepository,
    required AuthenticationRepository authenticationRepository,
  })  : _userYorshoRepository = userYorshoRepository,
        _authenticationRepository = authenticationRepository;

  @override
  FutureOr<Either<Failure, UserYorshoEntity>> call(
      CompleteUserYorshoUseCaseParams params) async {
    User? user = _authenticationRepository.currentFirebaseUser;
    if (user != null) {
      Either<Failure, UserYorshoEntity> resultRestApi =
          await user.getIdToken().then(
        (firebaseToken) async {
          return await _userYorshoRepository.completeUserYorshoMobileClient(
              firebaseToken!, params.userYorshoEntity);
        },
      );
      return resultRestApi;
    }
    return const Left(Failure(status: FailureStatus.authenticationFailure));
  }
}

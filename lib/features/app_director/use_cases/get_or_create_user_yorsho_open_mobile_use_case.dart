import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/failure/failure.dart';
import '../../../data/authentication/repositories/authentication_repository.dart';
import '../../../data/user_yorsho/repositories/user_basket_repository.dart';
import '../../../entities/user_yorsho/user_yorsho_entity.dart';

class GetOrCreateUserYorshoOpenMobileUseCase
    implements BaseUseCase<UserYorshoEntity, NoParams> {
  final AuthenticationRepository _authenticationRepository;
  final UserYorshoRepository _userYorshoRepository;

  const GetOrCreateUserYorshoOpenMobileUseCase({
    required AuthenticationRepository authenticationRepository,
    required UserYorshoRepository userYorshoRepository,
  })  : _userYorshoRepository = userYorshoRepository,
        _authenticationRepository = authenticationRepository;

  @override
  FutureOr<Either<Failure, UserYorshoEntity>> call(NoParams params) async {
    User? user = _authenticationRepository.currentFirebaseUser;
    if (user != null) {
      Either<Failure, UserYorshoEntity> resultRestApi =
          await user.getIdToken().then(
        (firebaseToken) async {
          return await _userYorshoRepository.getOrCreateUserYorshoOpenMobile(
            firebaseToken!,
          );
        },
      );
      return resultRestApi;
    }
    return const Left(Failure(status: FailureStatus.authenticationFailure));
  }
}

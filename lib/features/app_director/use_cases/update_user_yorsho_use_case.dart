import 'dart:async';


import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yorsho_mobile_branded_dev/features/app_director/use_cases/update_user_yorsho_use_case_params.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/failure/failure.dart';
import '../../../data/authentication/repositories/authentication_repository.dart';
import '../../../data/user_yorsho/repositories/user_basket_repository.dart';
import '../../../entities/user_yorsho/user_yorsho_entity.dart';

class UpdateUserYorshoUseCase
    implements BaseUseCase<UserYorshoEntity, UpdateUserYorshoUseCaseParams> {
  final UserYorshoRepository _userYorshoRepository;
  final AuthenticationRepository _authenticationRepository;

  const UpdateUserYorshoUseCase({
    required UserYorshoRepository userYorshoRepository,
    required AuthenticationRepository authenticationRepository,
  })  : _userYorshoRepository = userYorshoRepository,
        _authenticationRepository = authenticationRepository;

  @override
  FutureOr<Either<Failure, UserYorshoEntity>> call(
      UpdateUserYorshoUseCaseParams params) async {
    User? user = _authenticationRepository.currentFirebaseUser;
    if (user != null) {
      Either<Failure, UserYorshoEntity> resultRestApi =
          await user.getIdToken().then(
        (firebaseToken) async {
          return await _userYorshoRepository.updateUserYorshoMobileClient(
              firebaseToken!, params.userYorshoEntity);
        },
      );
      return resultRestApi;
    }
    return const Left(Failure(status: FailureStatus.authenticationFailure));
  }
}

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/failure/failure.dart';
import '../../../data/authentication/repositories/authentication_repository.dart';
import '../../../data/user_yorsho/repositories/user_basket_repository.dart';
import 'login_use_case_params.dart';

class LoginUseCase implements BaseUseCase<void, LoginUseCaseParams> {
  final AuthenticationRepository _authenticationRepository;
  final UserYorshoRepository _userYorshoRepository;

  const LoginUseCase({
    required AuthenticationRepository authenticationRepository,
    required UserYorshoRepository userYorshoRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userYorshoRepository = userYorshoRepository;

  @override
  FutureOr<Either<Failure, void>> call(LoginUseCaseParams params) async {
    Either<Failure, void> resultFirebase =
        await _authenticationRepository.logInWithEmailAndPassword(
            email: params.email, password: params.password);


    Either<Failure, void> result = await resultFirebase.fold(
      (failure) {
        _authenticationRepository.logOut();
        return resultFirebase;
      },
      (data) async {
        User? user = _authenticationRepository.currentFirebaseUser;
        if (user != null) {

          Either<Failure, void> resultRestApi = await user.getIdToken().then(
            (firebaseToken) async {
              return await _userYorshoRepository
                  .getOrCreateUserYorshoOpenMobile(firebaseToken!);
            },
          );
          return resultRestApi;
        } else {
          /// inja bayad check beshe *****
          return resultFirebase;
        }
      },
    );

    return result;
  }
}


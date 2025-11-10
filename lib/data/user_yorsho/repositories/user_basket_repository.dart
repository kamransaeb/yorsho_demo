import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../../entities/user_yorsho/user_yorsho_entity.dart';

abstract class UserYorshoRepository {
  Future<Either<Failure, UserYorshoEntity>> getOrCreateUserYorshoOpenMobile(String firebaseToken);
  Future<Either<Failure, UserYorshoEntity>> completeUserYorshoMobileClient(String firebaseToken, UserYorshoEntity userYorshoEntity);
  Future<Either<Failure, UserYorshoEntity>> updateUserYorshoMobileClient(String firebaseToken, UserYorshoEntity userYorshoEntity);
  //Future<Either<Failure, UserYorshoEntity>> getUserYorsho(String firebaseToken,);
}
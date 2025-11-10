import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/app_tenants/app_tenants.dart';
import '../../../../core/constants/cache_client_keys/cache_client_keys.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/failure/failure.dart';
import '../../../../services/cache_client_service/cache_client_service.dart';
import '../../../../services/log_service/log_service.dart';
import '../../../user_yorsho/data_sources/user_yorsho_remote_data_source.dart';
import '../../models/my_user.dart';
import '../authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required LogService logService,
    required CacheClientService cacheClientService,
    firebase_auth.FirebaseAuth? firebaseAuth,
    required UserYorshoRemoteDataSource userYorshoRemoteDataSource,
  })  : _logService = logService,
        _cacheClientService = cacheClientService,
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance..tenantId = AppTenants.currentTenantId,
        _userYorshoRemoteDataSource = userYorshoRemoteDataSource;

  final CacheClientService _cacheClientService;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final LogService _logService;
  final UserYorshoRemoteDataSource _userYorshoRemoteDataSource;


  @override
  Stream<MyUser?> get myUser {

    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      late MyUser myUser;
      if (firebaseUser == null) {
        _logService.i('AuthenticationRepositoryImpl myUser firebaseUser is null');
        myUser = MyUser.empty;
      } else {
        _logService.i('AuthenticationRepositoryImpl myUser firebaseUser.uid: ${firebaseUser.uid}');
        _logService.i('AuthenticationRepositoryImpl myUser firebaseUser.displayName: ${firebaseUser.displayName}');
        IdTokenResult idTokenResult = await firebaseUser.getIdTokenResult(true);
        String? role = idTokenResult.claims?['role'];
        myUser = firebaseUser.toUser(role);
        _logService.i('AuthenticationRepositoryImpl myUser idTokenResult.claims: ${idTokenResult.claims}');
      }
      _cacheClientService.write<MyUser>(key: CacheClientKeys.myUserCacheKey, value: myUser);
      return myUser;
    });
  }

  @override
  FutureOr<bool> isLoggedIn() async {
    if (_firebaseAuth.currentUser == null) {
      _logService.i('AuthenticationRepositoryImpl isLoggedIn() _firebaseAuth.currentUser is null');
      _cacheClientService.write<MyUser>(key: CacheClientKeys.myUserCacheKey, value: MyUser.empty);
      return false;
    } else {
      try {
        IdTokenResult? idTokenResult =
        await _firebaseAuth.currentUser?.getIdTokenResult(true);
        if (idTokenResult == null) {
          _cacheClientService.write<MyUser>(key: CacheClientKeys.myUserCacheKey, value: MyUser.empty);
          return false;
        } else {
          if (_firebaseAuth.currentUser!.emailVerified) {
            _logService.i('AuthenticationRepositoryImpl isLoggedIn() idTokenResult.claims: ${idTokenResult.claims}');
            String? role = idTokenResult.claims?['role'];
            _logService.i('AuthenticationRepositoryImpl isLoggedIn() idTokenResult role: $role');
            _cacheClientService.write<MyUser>(
                key: CacheClientKeys.myUserCacheKey, value: _firebaseAuth.currentUser!.toUser(role));
            return true;
          } else {
            _cacheClientService.write<MyUser>(key: CacheClientKeys.myUserCacheKey, value: MyUser.empty);
            return false;
          }
        }
      } catch (error, stackTrace) {
        _logService.e(
            'AuthenticationRepositoryImpl isLoggedIn()', error, stackTrace);
        return false;
      }
    }
  }

  @override
  MyUser get cachedMyUser {
    return _cacheClientService.read<MyUser>(key: CacheClientKeys.myUserCacheKey) ?? MyUser.empty;
  }

  @override
  User? get currentFirebaseUser {
    return _firebaseAuth.currentUser;
  }

  @override
  FutureOr<Either<Failure, void>> updateFirebaseUserDisplayName(
      {required String displayName}) async {
    try {
      await _firebaseAuth.currentUser!.updateDisplayName(displayName);
      await FirebaseAuth.instance.currentUser!.reload();
      _cacheClientService.write(key: CacheClientKeys.myUserCacheKey, value: _firebaseAuth.currentUser!.toUser);
      return const Right(null);
    } catch (error, stackTrace) {
      _logService.e(
          'AuthenticationRepositoryImpl updateFirebaseUserDisplayName()', error, stackTrace);
      return Left(Failure(message: const UpdateFirebaseUserDisplayNameException().message, status: FailureStatus.serverFailure));
    }
  }

  @override
  FutureOr<Either<Failure, void>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await userCredential.user!.sendEmailVerification();
        await _firebaseAuth.signOut();
      }
      return const Right(null);
    } on firebase_auth.FirebaseAuthException catch (error, stackTrace) {
      _cacheClientService.write<MyUser>(key: CacheClientKeys.myUserCacheKey, value: MyUser.empty);
      _logService.e(error.code, error, stackTrace);
      return Left(Failure(message: error.code, status: FailureStatus.serverFailure));
    } catch (error, stackTrace) {
      _cacheClientService.write<MyUser>(key: CacheClientKeys.myUserCacheKey, value: MyUser.empty);
      _logService.e(
          'AuthenticationRepositoryImpl signUpWithEmailAndPassword()', error, stackTrace);
      return const Left(Failure(message: 'exception_login_with_email_and_password_default', status: FailureStatus.serverFailure),);
    }
  }

  @override
  FutureOr<Either<Failure, void>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_firebaseAuth.currentUser!.emailVerified) {
        _cacheClientService.write(key: CacheClientKeys.myUserCacheKey, value: _firebaseAuth.currentUser!.toUser);
        return const Right(null);
      } else {
        await _firebaseAuth.signOut();
        _cacheClientService.write<MyUser>(key: CacheClientKeys.myUserCacheKey, value: MyUser.empty);
        return const Left(Failure(message: 'unverified-email', status: FailureStatus.authenticationFailure));
      }

    } on firebase_auth.FirebaseAuthException catch (error, stackTrace) {
      _cacheClientService.write<MyUser>(key: CacheClientKeys.myUserCacheKey, value: MyUser.empty);
      _logService.e(error.code, error, stackTrace);
      return Left(Failure(message: error.code, status: FailureStatus.serverFailure));
    } catch (error, stackTrace) {
      _cacheClientService.write<MyUser>(key: CacheClientKeys.myUserCacheKey, value: MyUser.empty);
      _logService.e(
          'AuthenticationRepositoryImpl logInWithEmailAndPassword()', error, stackTrace);
      return const Left(Failure(message: 'exception_log_in_with_email_and_password_default', status: FailureStatus.serverFailure),);
    }
  }

  @override
  FutureOr<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
      return const Right(null);
    } on firebase_auth.FirebaseAuthException catch (error, stackTrace) {
      _logService.e(error.code, error, stackTrace);
      return  Left(Failure(message: error.code, status: FailureStatus.serverFailure));
    } catch (error, stackTrace) {
      _logService.e(
          'AuthenticationRepositoryImpl sendPasswordResetEmail()', error, stackTrace);
      return const Left(Failure(message: 'exception_send_password_default', status: FailureStatus.serverFailure));
    }
  }

  @override
  FutureOr<Either<Failure, void>> logOut() async {
    try {
      await _firebaseAuth.signOut();
      _cacheClientService.write(key: CacheClientKeys.myUserCacheKey, value: MyUser.empty);
      return const Right(null);
    } catch (error, stackTrace) {
      _logService.e(
          'AuthenticationRepositoryImpl logOut()', error, stackTrace);
      return const Left(Failure(message: 'exception_log_out_default', status: FailureStatus.serverFailure));
    }
  }
}

extension on firebase_auth.User {
  MyUser toUser(String? role) {
    return MyUser(
      uid: uid,
      email: email,
      name: displayName,
      tenantId:  tenantId,
      role: role,
    );
  }
}
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../core/failure/failure.dart';
import '../models/my_user.dart';

abstract class AuthenticationRepository {
  FutureOr<Either<Failure, void>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  FutureOr<Either<Failure, void>> updateFirebaseUserDisplayName({
    required String displayName,
  });

  FutureOr<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  });

  FutureOr<Either<Failure, void>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  FutureOr<Either<Failure, void>> logOut();
  FutureOr<bool> isLoggedIn();
  Stream<MyUser?> get myUser;
  MyUser get cachedMyUser;
  User? get currentFirebaseUser;
}

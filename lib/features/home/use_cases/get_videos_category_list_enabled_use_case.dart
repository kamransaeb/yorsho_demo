import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yorsho_mobile_branded_dev/data/videos_category/repositories/videos_category_repository.dart';
import 'package:yorsho_mobile_branded_dev/entities/videos_category/videos_category_entity.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/failure/failure.dart';
import '../../../data/authentication/repositories/authentication_repository.dart';

class GetVideosCategoryListEnabledUseCase
    implements BaseUseCase<List<VideosCategoryEntity>, NoParams> {
  final AuthenticationRepository _authenticationRepository;
  final VideosCategoryRepository _videosCategoryRepository;

  const GetVideosCategoryListEnabledUseCase({
    required AuthenticationRepository authenticationRepository,
    required VideosCategoryRepository videosCategoryRepository,
  }) : _authenticationRepository = authenticationRepository,
        _videosCategoryRepository = videosCategoryRepository;

  @override
  FutureOr<Either<Failure, List<VideosCategoryEntity>>> call(
    NoParams params,
  ) async {
    User? user = _authenticationRepository.currentFirebaseUser;
    if (user != null) {
      Either<Failure, List<VideosCategoryEntity>> resultRestApi = await user
          .getIdToken()
          .then((firebaseToken) async {
            return await _videosCategoryRepository.getVideosCategoryListEnabledMobileClient(
              firebaseToken!,
            );
          });
      return resultRestApi;
    }
    return const Left(Failure(status: FailureStatus.authenticationFailure));
  }
}

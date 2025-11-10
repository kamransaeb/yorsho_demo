import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/failure/failure.dart';
import '../../../data/authentication/repositories/authentication_repository.dart';
import '../../../data/videos/repositories/videos_repository.dart';
import '../../../entities/videos/videos_entity.dart';
import 'get_videos_list_enabled_by_videos_category_id_list_params.dart';

class GetVideosListEnabledByVideosCategoryIdListUseCase
    implements BaseUseCase<List<VideosEntity>, GetVideosListEnabledByVideosCategoryIdListParams> {
  final AuthenticationRepository _authenticationRepository;
  final VideosRepository _videosRepository;

  const GetVideosListEnabledByVideosCategoryIdListUseCase({
    required AuthenticationRepository authenticationRepository,
    required VideosRepository videosRepository, }
  )   : _authenticationRepository = authenticationRepository,
        _videosRepository = videosRepository;

  @override
  FutureOr<Either<Failure, List<VideosEntity>>> call(
      GetVideosListEnabledByVideosCategoryIdListParams getVideosListEnabledByVideosCategoryIdListParams) async {

    User? user = _authenticationRepository.currentFirebaseUser;
    if (user != null) {
      Either<Failure, List<VideosEntity>> resultRestApi =
          await user.getIdToken().then(
            (firebaseToken) async {
          return await  _videosRepository.getVideosListEnabledByVideosCategoryIdListMobileClient(firebaseToken!, getVideosListEnabledByVideosCategoryIdListParams.videosCategoryIdList);
        },
      );
      return resultRestApi;
    }
    return const Left(Failure(status: FailureStatus.authenticationFailure));
  }
}

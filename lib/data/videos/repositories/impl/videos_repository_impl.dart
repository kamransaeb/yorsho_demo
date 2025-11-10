import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/failure/failure.dart';
import '../../../../entities/videos/videos_entity.dart';
import '../../../../services/log_service/log_service.dart';
import '../../data_sources/remote/videos_remote_data_source.dart';
import '../videos_repository.dart';

class VideosRepositoryImpl implements VideosRepository {

  final LogService _logService;
  final VideosRemoteDataSource _videosRemoteDataSource;
  const VideosRepositoryImpl(
  {
      required VideosRemoteDataSource videosRemoteDataSource,
      required LogService logService,
  }) : _videosRemoteDataSource = videosRemoteDataSource,
        _logService = logService;

  @override
  Future<Either<Failure, List<VideosEntity>>> getVideosListEnabledByVideosCategoryIdListMobileClient(String firebaseToken, List<int> videosCategoryIdList,) async {
    try {
      final response = await _videosRemoteDataSource.getVideosListEnabledByVideosCategoryIdListMobileClient(firebaseToken, videosCategoryIdList);
      // here we have to do the conversion
      List<VideosEntity> videosEntityList = response.map((model) => model.toEntity()).toList() ?? [];
      return Right(videosEntityList);
    } on RestApiException {
      //return const Left(ServerFailure('An error has occurred'));
      return const Left(Failure(message: 'server_error_please_try_again', status: FailureStatus.serverFailure));
    } on SocketException {
      return const Left(Failure(message: 'internet_connection_failure', status: FailureStatus.connectionFailure));
    }
  }

}
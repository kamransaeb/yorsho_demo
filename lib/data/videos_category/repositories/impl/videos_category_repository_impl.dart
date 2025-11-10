import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/failure/failure.dart';
import '../../../../entities/videos_category/videos_category_entity.dart';
import '../../../../services/log_service/log_service.dart';
import '../../data_sources/remote/videos_category_remote_data_source.dart';
import '../videos_category_repository.dart';

class VideosCategoryRepositoryImpl implements VideosCategoryRepository {

  final LogService _logService;
  final VideosCategoryRemoteDataSource _videosCategoryRemoteDataSource;
  const VideosCategoryRepositoryImpl(
  {
      required VideosCategoryRemoteDataSource videosCategoryRemoteDataSource,
      required LogService logService,
  }) : _videosCategoryRemoteDataSource = videosCategoryRemoteDataSource,
        _logService = logService;

  @override
  Future<Either<Failure, List<VideosCategoryEntity>>> getVideosCategoryListEnabledMobileClient(String firebaseToken,) async {
    try {
      final response = await _videosCategoryRemoteDataSource.getVideosCategoryListEnabledMobileClient(firebaseToken);
      // here we have to do the conversion
      List<VideosCategoryEntity> videosCategoryEntityList = response.map((model) => model.toEntity()).toList() ?? [];

      return Right(videosCategoryEntityList);
    } on RestApiException {
      //return const Left(ServerFailure('An error has occurred'));
      return const Left(Failure(message: 'server_error_please_try_again', status: FailureStatus.serverFailure));
    } on SocketException {
      return const Left(Failure(message: 'internet_connection_failure', status: FailureStatus.connectionFailure));
    }
  }

}
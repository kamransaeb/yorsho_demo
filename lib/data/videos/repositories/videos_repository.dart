import 'package:dartz/dartz.dart';
import '../../../core/failure/failure.dart';
import '../../../entities/videos/videos_entity.dart';

abstract class VideosRepository {
  Future<Either<Failure, List<VideosEntity>>> getVideosListEnabledByVideosCategoryIdListMobileClient(String firebaseToken, List<int> videosCategoryIdList,);

}


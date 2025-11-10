import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../core/failure/failure.dart';
import '../../../entities/videos_category/videos_category_entity.dart';

abstract class VideosCategoryRepository {
  Future<Either<Failure, List<VideosCategoryEntity>>> getVideosCategoryListEnabledMobileClient(String firebaseToken,);
}


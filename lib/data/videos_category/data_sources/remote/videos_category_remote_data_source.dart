import '../../models/videos_category_model.dart';

abstract class VideosCategoryRemoteDataSource {
  Future<List<VideosCategoryModel>> getVideosCategoryListEnabledMobileClient(String firebaseToken,);

}

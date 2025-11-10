import '../../models/videos_model.dart';

abstract class VideosRemoteDataSource {
  Future<List<VideosModel>> getVideosListEnabledByVideosCategoryIdListMobileClient(String firebaseToken, List<int> videosCategoryIdList);
}

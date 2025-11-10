
import '../../app_config/app_config.dart';

class Urls {
  Urls._();

  // AppData
  static String appDataOpenMobile() => '${AppConfig.baseUrl}/open/mobile/app-data';

  // UserYorsho
  static String getOrCreateUserYorshoOpenMobile() => '${AppConfig.baseUrl}/open/mobile/user-yorsho/get-or-create';
  static String getUserYorshoMobileClient() => '${AppConfig.baseUrl}/mobile/client/user-yorsho';
  static String completeUserYorshoMobileClient() => '${AppConfig.baseUrl}/mobile/client/user-yorsho/complete';
  static String updateUserYorshoMobileClient() => '${AppConfig.baseUrl}/mobile/client/user-yorsho';

  // Videos
  static String getVideosListEnabledByVideosCategoryIdListMobileClient() => '${AppConfig.baseUrl}/mobile/client/videos/enabled/videos-category-id-list';

  // VideosCategory
  static String getVideosCategoryListEnabledMobileClient() => '${AppConfig.baseUrl}/mobile/client/videos-category/enabled';


}
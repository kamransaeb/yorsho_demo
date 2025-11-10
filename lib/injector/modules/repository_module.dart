import 'package:get_it/get_it.dart';
import '../../data/app_data/repositories/app_data_repository.dart';
import '../../data/app_data/repositories/impl/app_data_repository_impl.dart';
import '../../data/authentication/repositories/authentication_repository.dart';
import '../../data/authentication/repositories/impl/authentication_repository_impl.dart';
import '../../data/user_yorsho/repositories/impl/user_basket_repository_impl.dart';
import '../../data/user_yorsho/repositories/user_basket_repository.dart';
import '../../data/videos/repositories/impl/videos_repository_impl.dart';
import '../../data/videos/repositories/videos_repository.dart';
import '../../data/videos_category/repositories/impl/videos_category_repository_impl.dart';
import '../../data/videos_category/repositories/videos_category_repository.dart';
import '../injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static final GetIt _injector = Injector.instance;

  static void setup() {
    _injector
      ..registerSingleton<AppDataRepository>(
      AppDataRepositoryImpl(
        appDataRemoteDataSource: _injector(),
      ),
    )..registerSingleton<UserYorshoRepository>(
      UserYorshoRepositoryImpl(
        userYorshoRemoteDataSource: _injector(),
        cacheClientService: _injector(),
        logService: _injector(),
      ),
    )
      ..registerSingleton<VideosRepository>(
        VideosRepositoryImpl(
          videosRemoteDataSource: _injector(),
          logService: _injector(),
        ),
      )
      ..registerSingleton<VideosCategoryRepository>(
        VideosCategoryRepositoryImpl(
          videosCategoryRemoteDataSource:_injector(),
          logService: _injector(),
        ),
      )
      ..registerSingleton<AuthenticationRepository>(
        AuthenticationRepositoryImpl(
          logService: _injector(),
          cacheClientService: _injector(),
          userYorshoRemoteDataSource: _injector(),
        ),
      );
    }
}

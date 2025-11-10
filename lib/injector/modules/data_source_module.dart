import 'package:get_it/get_it.dart';
import '../../data/app_data/data_sources/remote/app_data_remote_data_source.dart';
import '../../data/app_data/data_sources/remote/impl/app_data_remote_data_source_impl.dart';
import '../../data/user_yorsho/data_sources/remote/impl/user_yorsho_remote_data_source_impl.dart';
import '../../data/user_yorsho/data_sources/user_yorsho_remote_data_source.dart';
import '../../data/videos/data_sources/remote/impl/videos_remote_data_source_impl.dart';
import '../../data/videos/data_sources/remote/videos_remote_data_source.dart';
import '../../data/videos_category/data_sources/remote/impl/videos_category_remote_data_source_impl.dart';
import '../../data/videos_category/data_sources/remote/videos_category_remote_data_source.dart';
import '../injector.dart';
import 'dio_module.dart';

class DatasourceModule {
  DatasourceModule._();

  static final GetIt _injector = Injector.instance;

  static void setup() {
    _injector
      ..registerFactory<AppDataRemoteDataSource>(
        () => AppDataRemoteDataSourceImpl(
          dio: _injector(instanceName: DioModule.dioInstanceName),
        ),
      )
      ..registerFactory<VideosRemoteDataSource>(
        () => VideosRemoteDataSourceImpl(
          dio: _injector(instanceName: DioModule.dioInstanceName),
        ),
      )
      ..registerFactory<VideosCategoryRemoteDataSource>(
        () => VideosCategoryRemoteDataSourceImpl(
          dio: _injector(instanceName: DioModule.dioInstanceName),
        ),
      )
      ..registerFactory<UserYorshoRemoteDataSource>(
        () => UserYorshoRemoteDataSourceImpl(
          dio: _injector(instanceName: DioModule.dioInstanceName),
        ),
      );
  }
}

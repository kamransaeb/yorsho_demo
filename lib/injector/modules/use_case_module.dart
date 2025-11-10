import 'package:get_it/get_it.dart';
import 'package:yorsho_mobile_branded_dev/features/home/use_cases/get_videos_category_list_enabled_use_case.dart';
import 'package:yorsho_mobile_branded_dev/features/home/use_cases/get_videos_list_enabled_by_videos_category_id_list_use_case.dart';

import '../../features/app/use_cases/get_app_data_use_case.dart';
import '../../features/app_director/use_cases/get_or_create_user_yorsho_open_mobile_use_case.dart';
import '../../features/app_director/use_cases/update_user_yorsho_use_case.dart';
import '../../features/home/use_cases/complete_user_yorsho_use_case.dart';
import '../../features/login/use_cases/login_use_case.dart';
import '../../features/reset_password/use_cases/reset_password_use_case.dart';
import '../../features/sign_up/use_cases/sign_up_use_case.dart';
import '../injector.dart';

class UseCaseModule {
  UseCaseModule._();

  static final GetIt _injector = Injector.instance;

  static void setup() {
    _injector
      ..registerSingleton<GetAppDataUseCase>(
        GetAppDataUseCase(
          appDataRepository: _injector(),
        ),
      )  ..registerSingleton<UpdateUserYorshoUseCase>(
      UpdateUserYorshoUseCase(
        authenticationRepository: _injector(),
        userYorshoRepository: _injector(),
      ),
    )
      ..registerSingleton<CompleteUserYorshoUseCase>(
        CompleteUserYorshoUseCase(
          authenticationRepository: _injector(),
          userYorshoRepository: _injector(),
        ),
      )

      ..registerSingleton<GetVideosCategoryListEnabledUseCase>(
        GetVideosCategoryListEnabledUseCase(
          videosCategoryRepository: _injector(),
          authenticationRepository: _injector(),
        ),
      )
      ..registerSingleton<GetVideosListEnabledByVideosCategoryIdListUseCase>(
        GetVideosListEnabledByVideosCategoryIdListUseCase(
          videosRepository: _injector(),
          authenticationRepository: _injector(),
        ),
      )


      ..registerSingleton<GetOrCreateUserYorshoOpenMobileUseCase>(
        GetOrCreateUserYorshoOpenMobileUseCase(
          userYorshoRepository: _injector(),
          authenticationRepository: _injector(),
        ),
      )

      ..registerSingleton<ResetPasswordUseCase>(
        ResetPasswordUseCase(
          authenticationRepository: _injector(),
        ),
      )
      ..registerSingleton<SignUpUseCase>(
        SignUpUseCase(
          authenticationRepository: _injector(),
        ),
      )
      ..registerSingleton<LoginUseCase>(
        LoginUseCase(
          authenticationRepository: _injector(),
          userYorshoRepository: _injector(),
        ),
      );
  }
}

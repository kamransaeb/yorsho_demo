import 'package:get_it/get_it.dart';

import '../../features/app/presentation/bloc/app_bloc.dart';
import '../../features/app_director/presentation/bloc/app_director_bloc.dart';
import '../../features/home/presentation/bloc/home/home_bloc.dart';
import '../../features/home/presentation/bloc/home_agreements/home_agreements_bloc.dart';
import '../../features/home/presentation/bloc/home_birth_date/home_birth_date_bloc.dart';
import '../../features/home/presentation/bloc/home_gender/home_gender_bloc.dart';
import '../../features/home/presentation/bloc/home_name_surname/home_name_surname_bloc.dart';
import '../../features/home/presentation/bloc/home_profile_photo/home_profile_photo_bloc.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/reset_password/presentation/cubit/reset_password_cubit.dart';
import '../../features/sign_up/presentation/cubit/sign_up_cubit.dart';
import '../../features/videos/presentation/bloc/videos_bloc.dart';
import '../injector.dart';

class BlocModule {
  const BlocModule._();

  static final GetIt _injector = Injector.instance;

  static void setup() {
    _injector
      ..registerLazySingleton<AppBloc>(
        () => AppBloc(
          authenticationRepository: _injector(),
         // localNotificationPluginService: _injector(),
          appService: _injector(),
          logService: _injector(),
          cacheClientService: _injector(),
          getAppDataUseCase: _injector(),
        ),
      )
      ..registerFactory<AppDirectorBloc>(
        () => AppDirectorBloc(
          authenticationRepository: _injector(),
         // fcmService: _injector(),
          getOrCreateUserYorshoOpenMobileUseCase: _injector(),
          updateUserYorshoUseCase: _injector(),
          appService: _injector(),
          cacheClientService: _injector(),
        ),
      )
      ..registerFactory<HomeBloc>(
        () => HomeBloc(
          getVideosCategoryListEnabledUseCase: _injector(),
          getVideosListEnabledByVideosCategoryIdListUseCase: _injector(),
          updateUserYorshoUseCase: _injector(),
          cacheClientService: _injector(),
        ),
      )
      ..registerFactory<VideosBloc>(
            () => VideosBloc(
          cacheClientService: _injector(),
        ),
      )
      ..registerFactory<ResetPasswordCubit>(
            () => ResetPasswordCubit(
          resetPasswordUseCase: _injector(),
          logService: _injector(),
        ),
      )
      ..registerFactory<LoginBloc>(
            () => LoginBloc(
              authenticationRepository: _injector(),
            cacheClientService: _injector(),
            loginUseCase: _injector(),
            logService: _injector(),
        ),
      )
      ..registerFactory<SignUpCubit>(
            () => SignUpCubit(
          signUpUseCase: _injector(),
          logService: _injector(),
        ))

      ..registerFactory<HomeAgreementsBloc>(() => HomeAgreementsBloc(
        cacheClientService: _injector(),
        appService: _injector(),
        completeUserYorshoUseCase: _injector(),
      ))
      ..registerFactory<HomeProfilePhotoBloc>(() => HomeProfilePhotoBloc(
        cacheClientService: _injector(),
        firebaseService: _injector()
      ))
      ..registerFactory<HomeBirthDateBloc>(() => HomeBirthDateBloc())
      ..registerFactory<HomeNameSurnameBloc>(() => HomeNameSurnameBloc())
      ..registerFactory<HomeGenderBloc>(() => HomeGenderBloc());
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/constants/cache_client_keys/cache_client_keys.dart';
import '../../../../core/failure/failure.dart';
import '../../../../data/authentication/repositories/authentication_repository.dart';
import '../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../services/app_service/app_service.dart';
import '../../../../services/cache_client_service/cache_client_service.dart';
import '../../use_cases/get_or_create_user_yorsho_open_mobile_use_case.dart';
import '../../use_cases/update_user_yorsho_use_case.dart';
import '../../use_cases/update_user_yorsho_use_case_params.dart';

part 'app_director_event.dart';

part 'app_director_state.dart';

class AppDirectorBloc extends Bloc<AppDirectorEvent, AppDirectorState> {
  final CacheClientService _cacheClientService;
  final GetOrCreateUserYorshoOpenMobileUseCase _getOrCreateUserYorshoOpenMobileUseCase;
  final UpdateUserYorshoUseCase _updateUserYorshoUseCase;
  final AppService _appService;
  final AuthenticationRepository _authenticationRepository;

  AppDirectorBloc({
    required CacheClientService cacheClientService,
    required GetOrCreateUserYorshoOpenMobileUseCase getOrCreateUserYorshoOpenMobileUseCase,
    required UpdateUserYorshoUseCase updateUserYorshoUseCase,
    required AppService appService,
    required AuthenticationRepository authenticationRepository,
  })  : _cacheClientService = cacheClientService,
        _getOrCreateUserYorshoOpenMobileUseCase = getOrCreateUserYorshoOpenMobileUseCase,
        _updateUserYorshoUseCase = updateUserYorshoUseCase,
        _appService = appService,
        _authenticationRepository = authenticationRepository,
        super(
        const AppDirectorState(
          userYorshoEntity: UserYorshoEntity.empty,
        ),
      ) {
    on<AppDirectorEventFetched>(_onAppDirectorEventFetched);
    on<AppDirectorEventFirstUseDisabled>(_onAppDirectorEventFirstUseDisabled);
  }

  _onAppDirectorEventFirstUseDisabled(AppDirectorEventFirstUseDisabled event,
      Emitter<AppDirectorState> emit) async {
    if (state.isFirstUse) {
      emit(
        state.copyWith(
          appDirectorStatus: AppDirectorStatus.loading,
        ),
      );
      await _appService.setIsFirstUse(isFirstUse: false);
      emit(
        state.copyWith(
          isFirstUse: false,
          appDirectorStatus: AppDirectorStatus.success,
        ),
      );
    }
  }

  _onAppDirectorEventFetched(
      AppDirectorEventFetched event, Emitter<AppDirectorState> emit) async {
    emit(
      state.copyWith(
        appDirectorStatus: AppDirectorStatus.loading,
      ),
    );
    final bool isFirstUse = _appService.isFirstUse;
    Either<Failure, UserYorshoEntity> getOrCreateUserYorshoOpenMobileResult =
    await _getOrCreateUserYorshoOpenMobileUseCase(NoParams());
    await getOrCreateUserYorshoOpenMobileResult.fold(
          (getOrCreateFailure) {
        emit(
          state.copyWith(
            isFirstUse: isFirstUse,
            appDirectorStatus: AppDirectorStatus.failure,
            failure: Failure(
              message: getOrCreateFailure.message,
              status: getOrCreateFailure.status,
            ),
          ),
        );
      },
          (getOrCreateData) async {

        bool isAppUpdate = _appService.isAppUpdate;
        if (!isAppUpdate) {
          emit(
            state.copyWith(
              appDirectorStatus: AppDirectorStatus.failure,
              failure: const Failure(message: 'please_click_to_update_the_app', status: FailureStatus.isAppUpdateFailure),
              isAppUpdate: isAppUpdate,
              updateAppStoreUrlEn: _appService.storeUrlEn,
              updateAppStoreUrlTr: _appService.storeUrlTr,
            ),
          );
        } else {

          bool updateRequired = false;
          bool forceLogoutRequired = false;

          if (getOrCreateData.languageCode != _appService.locale) {
            getOrCreateData = getOrCreateData.copyWith(
                languageCode: getOrCreateData.languageCode);
            await _appService.setLocale(locale: getOrCreateData.languageCode);
            updateRequired = true;
          }

          if (getOrCreateData.forceLogout) {
            getOrCreateData = getOrCreateData.copyWith(
                forceLogout: false);
            updateRequired = true;
            forceLogoutRequired = true;
          }

          if (updateRequired) {
            Either<Failure, UserYorshoEntity> updateResult =
            await _updateUserYorshoUseCase(
              UpdateUserYorshoUseCaseParams(
                userYorshoEntity: getOrCreateData,
              ),
            );

            updateResult.fold(
                  (updateFailure) {
                emit(
                  state.copyWith(
                    isFirstUse: isFirstUse,
                    appDirectorStatus: AppDirectorStatus.failure,
                    failure: Failure(
                      message: updateFailure.message,
                      status: updateFailure.status,
                    ),
                    userYorshoEntity: getOrCreateData,
                  ),
                );
              },
                  (updatedData) {
                _cacheClientService.write(
                    key: CacheClientKeys.userYorshoEntityCacheKey,
                    value: updatedData);

                emit(
                  state.copyWith(
                    isFirstUse: isFirstUse,
                    appDirectorStatus: AppDirectorStatus.success,
                    userYorshoEntity: updatedData,
                    failure: const Failure(),
                  ),
                );

                if (forceLogoutRequired) {
                  _authenticationRepository.logOut();
                }
              },
            );
          } else {
            emit(
              state.copyWith(
                isFirstUse: isFirstUse,
                appDirectorStatus: AppDirectorStatus.success,
                failure: const Failure(),
                userYorshoEntity: getOrCreateData,
              ),
            );
          }
        }

      },
    );
  }
}

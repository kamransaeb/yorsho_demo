import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yorsho_mobile_branded_dev/features/home/use_cases/get_videos_category_list_enabled_use_case.dart';
import 'package:yorsho_mobile_branded_dev/features/home/use_cases/get_videos_list_enabled_by_videos_category_id_list_use_case.dart';
import '../../../../../core/base_use_case/base_use_case.dart';
import '../../../../../core/constants/cache_client_keys/cache_client_keys.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../entities/videos/videos_entity.dart';
import '../../../../../entities/videos_category/videos_category_entity.dart';
import '../../../../../services/app_service/app_service.dart';
import '../../../../../services/cache_client_service/cache_client_service.dart';
import '../../../../app_director/use_cases/update_user_yorsho_use_case.dart';
import '../../../../app_director/use_cases/update_user_yorsho_use_case_params.dart';
import '../../../use_cases/get_videos_list_enabled_by_videos_category_id_list_params.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CacheClientService _cacheClientService;
  final UpdateUserYorshoUseCase _updateUserYorshoUseCase;
  final GetVideosCategoryListEnabledUseCase
  _getVideosCategoryListEnabledUseCase;
  final GetVideosListEnabledByVideosCategoryIdListUseCase
  _getVideosListEnabledByVideosCategoryIdListUseCase;

  late final StreamSubscription _userYorshoEntityCachedSubscription;

  @override
  Future<void> close() {
    _userYorshoEntityCachedSubscription.cancel();
    return super.close();
  }

  HomeBloc({
    required CacheClientService cacheClientService,
    required UpdateUserYorshoUseCase updateUserYorshoUseCase,
    required GetVideosCategoryListEnabledUseCase
    getVideosCategoryListEnabledUseCase,
    required GetVideosListEnabledByVideosCategoryIdListUseCase
    getVideosListEnabledByVideosCategoryIdListUseCase,
  }) : _cacheClientService = cacheClientService,
       _updateUserYorshoUseCase = updateUserYorshoUseCase,
       _getVideosCategoryListEnabledUseCase =
           getVideosCategoryListEnabledUseCase,
       _getVideosListEnabledByVideosCategoryIdListUseCase =
           getVideosListEnabledByVideosCategoryIdListUseCase,
       super(const HomeState(userYorshoEntity: UserYorshoEntity.empty)) {
    _userYorshoEntityCachedSubscription = _cacheClientService
        .userYorshoEntityCached
        .listen((user) {
          UserYorshoEntity userYorshoEntityCached = user as UserYorshoEntity;
          add(
            _HomeEventUserReload(
              userYorshoEntityCached: userYorshoEntityCached,
            ),
          );
        });
    on<HomeEventFetched>(_onHomeEventFetched);
    on<HomeEventLocaleChanged>(_onHomeEventLocaleChanged);
    on<_HomeEventUserReload>(_onHomeEventUserReload);
  }

  _onHomeEventLocaleChanged(
    HomeEventLocaleChanged event,
    Emitter<HomeState> emit,
  ) async {
    UserYorshoEntity? userYorshoEntityToUpdate = _cacheClientService
        .read<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey);

    Either<Failure, UserYorshoEntity> updateResult =
        await _updateUserYorshoUseCase(
          UpdateUserYorshoUseCaseParams(
            userYorshoEntity: userYorshoEntityToUpdate!.copyWith(
              languageCode: event.locale,
            ),
          ),
        );
    updateResult.fold((updateFailure) {}, (updatedData) {
      _cacheClientService.write(
        key: CacheClientKeys.userYorshoEntityCacheKey,
        value: updatedData,
      );

      emit(
        state.copyWith(userYorshoEntity: updatedData, failure: const Failure()),
      );
    });
  }

  _onHomeEventUserReload(_HomeEventUserReload event, Emitter<HomeState> emit) {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    emit(
      state.copyWith(
        homeStatus: HomeStatus.success,
        userYorshoEntity: event.userYorshoEntityCached,
      ),
    );
  }

  _onHomeEventFetched(HomeEventFetched event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));

    UserYorshoEntity? userYorshoEntity = _cacheClientService
        .read<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey);

    Either<Failure, List<VideosCategoryEntity>>
    resultGetVideosCategoryListEnabledUseCase =
        await _getVideosCategoryListEnabledUseCase(NoParams());

    await resultGetVideosCategoryListEnabledUseCase.fold(
      (failure) {
        emit(
          state.copyWith(
            userYorshoEntity: userYorshoEntity,
            homeStatus: HomeStatus.failure,
            failure: Failure(message: failure.message, status: failure.status),
          ),
        );
      },
      (videosCategoryListEnabled) async {
        if (videosCategoryListEnabled.isNotEmpty) {
          List<int> videosCategoryIdList = List.from(
            videosCategoryListEnabled.map((e) => e.id),
          );

          Either<Failure, List<VideosEntity>>
          resultGetVideosListEnabledByVideosCategoryIdListUseCase =
              await _getVideosListEnabledByVideosCategoryIdListUseCase(
                GetVideosListEnabledByVideosCategoryIdListParams(
                  videosCategoryIdList: videosCategoryIdList,
                ),
              );

          resultGetVideosListEnabledByVideosCategoryIdListUseCase.fold(
            (failure) {
              emit(
                state.copyWith(
                  userYorshoEntity: userYorshoEntity,
                  homeStatus: HomeStatus.failure,
                  failure: Failure(
                    message: failure.message,
                    status: failure.status,
                  ),
                ),
              );
            },

            (videosListEnabledByVideosCategoryIdList) {
              videosListEnabledByVideosCategoryIdList.sort((a, b) => a.createDate!.compareTo(b.createDate!),);
              List<List<int>> videosCategoryIndexVideosIndex = [];
              Map<int, int> videosCategoryIdIndexMap = {};

              for (int i = 0; i < videosCategoryListEnabled.length; i++) {
                videosCategoryIndexVideosIndex.add([]);
                videosCategoryIdIndexMap[videosCategoryListEnabled[i].id!] = i;
              }

              for (
                int j = 0;
                j < videosListEnabledByVideosCategoryIdList.length;
                j++
              ) {
                int videosCategoryIndex =
                    videosCategoryIdIndexMap[videosListEnabledByVideosCategoryIdList[j]
                        .videosCategoryId]!;
                videosCategoryIndexVideosIndex[videosCategoryIndex].add(j);
              }

              emit(
                state.copyWith(
                  videosCategoryIndexVideosIndex:
                      videosCategoryIndexVideosIndex,
                  videosCategoryListEnabled: videosCategoryListEnabled,
                  videosListEnabledByVideosCategoryIdList:
                      videosListEnabledByVideosCategoryIdList,

                  homeStatus: HomeStatus.success,
                  failure: const Failure(),
                  userYorshoEntity: userYorshoEntity,
                ),
              );
            },
          );
        } else {
          emit(
            state.copyWith(
              homeStatus: HomeStatus.success,
              failure: const Failure(),
              userYorshoEntity: userYorshoEntity,
            ),
          );
        }
      },
    );
  }
}

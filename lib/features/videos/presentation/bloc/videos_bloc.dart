import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../services/cache_client_service/cache_client_service.dart';

part 'videos_event.dart';

part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final CacheClientService _cacheClientService;

  VideosBloc({
    required CacheClientService cacheClientService,
  }) : _cacheClientService = cacheClientService,

       super(const VideosState()) {
    on<VideosEventFetched>(_onVideosEventFetched);

  }



  _onVideosEventFetched(VideosEventFetched event, Emitter<VideosState> emit) async {
    emit(state.copyWith(videosStatus: VideosStatus.loading));
    emit(
      state.copyWith(
        videosStatus: VideosStatus.success,
        failure: const Failure(),
      ),
    );
  }
}

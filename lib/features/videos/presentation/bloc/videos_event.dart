part of 'videos_bloc.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();

  @override
  List<Object?> get props => [];
}

final class VideosEventFetched extends VideosEvent {
  const VideosEventFetched();
}


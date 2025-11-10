part of 'videos_bloc.dart';

enum VideosStatus { initial, loading, success, failure }

class VideosState extends Equatable {
  final VideosStatus videosStatus;
  final Failure failure;

  @override
  List<Object?> get props => [
        videosStatus,
        failure,
      ];

  const VideosState({
    this.videosStatus = VideosStatus.initial,
    this.failure = const Failure(),

  });

//<editor-fold desc="Data Methods">

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VideosState &&
          runtimeType == other.runtimeType &&
          failure == other.failure &&
          videosStatus == other.videosStatus);

  @override
  int get hashCode =>
      failure.hashCode ^
      videosStatus.hashCode;

  @override
  String toString() {
    return 'VideosState{' +
        ' videosStatus: $videosStatus,' +
        ' failure: $failure,' +
        '}';
  }

  VideosState copyWith({
    VideosStatus? videosStatus,
    Failure? failure,
  }) {
    return VideosState(
      videosStatus: videosStatus ?? this.videosStatus,
      failure: failure ?? this.failure,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'videosStatus': this.videosStatus,
      'failure': this.failure,
    };
  }

  factory VideosState.fromMap(Map<String, dynamic> map) {
    return VideosState(
      videosStatus: map['videosStatus'] as VideosStatus,
      failure: map['failure'] as Failure,
    );
  }

//</editor-fold>
}

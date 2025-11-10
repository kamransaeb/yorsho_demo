part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final UserYorshoEntity userYorshoEntity;
  final HomeStatus homeStatus;
  final Failure failure;
  final List<VideosCategoryEntity> videosCategoryListEnabled;
  final List<VideosEntity> videosListEnabledByVideosCategoryIdList;
  final List<List<int>> videosCategoryIndexVideosIndex;

  @override
  List<Object?> get props => [
        userYorshoEntity,
        videosCategoryListEnabled,
        videosListEnabledByVideosCategoryIdList,
    videosCategoryIndexVideosIndex,
        homeStatus,
        failure,
      ];

  const HomeState({
    required this.userYorshoEntity,
    this.homeStatus = HomeStatus.initial,
    this.failure = const Failure(),
    this.videosCategoryIndexVideosIndex = const [],
    this.videosCategoryListEnabled = const [],
    this.videosListEnabledByVideosCategoryIdList = const [],
  });

//<editor-fold desc="Data Methods">

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeState &&
          runtimeType == other.runtimeType &&
          userYorshoEntity == other.userYorshoEntity &&
          videosCategoryIndexVideosIndex == other.videosCategoryIndexVideosIndex &&
          videosCategoryListEnabled == other.videosCategoryListEnabled &&
          videosListEnabledByVideosCategoryIdList == other.videosListEnabledByVideosCategoryIdList &&
          failure == other.failure &&
          homeStatus == other.homeStatus);

  @override
  int get hashCode =>
      userYorshoEntity.hashCode ^
      videosCategoryIndexVideosIndex.hashCode ^
      videosCategoryListEnabled.hashCode ^
      videosListEnabledByVideosCategoryIdList.hashCode ^
      failure.hashCode ^
      homeStatus.hashCode;

  @override
  String toString() {
    return 'HomeState{' +
        ' userYorshoEntity: $userYorshoEntity,' +
        ' homeStatus: $homeStatus,' +

        ' videosCategoryIndexVideosIndex: $videosCategoryIndexVideosIndex,' +
        ' videosCategoryListEnabled: $videosCategoryListEnabled,' +
        ' videosListEnabledByVideosCategoryIdList: $videosListEnabledByVideosCategoryIdList,' +

        ' failure: $failure,' +
        '}';
  }

  HomeState copyWith({
    UserYorshoEntity? userYorshoEntity,
    HomeStatus? homeStatus,
    Failure? failure,
    List<VideosCategoryEntity>? videosCategoryListEnabled,
    List<VideosEntity>? videosListEnabledByVideosCategoryIdList,
    List<List<int>>? videosCategoryIndexVideosIndex,

  }) {
    return HomeState(
      userYorshoEntity: userYorshoEntity ?? this.userYorshoEntity,
      homeStatus: homeStatus ?? this.homeStatus,
      failure: failure ?? this.failure,
      videosCategoryListEnabled: videosCategoryListEnabled ?? this.videosCategoryListEnabled,
      videosListEnabledByVideosCategoryIdList: videosListEnabledByVideosCategoryIdList ?? this.videosListEnabledByVideosCategoryIdList,
      videosCategoryIndexVideosIndex: videosCategoryIndexVideosIndex ?? this.videosCategoryIndexVideosIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userYorshoEntity': this.userYorshoEntity,
      'homeStatus': this.homeStatus,

      'videosCategoryListEnabled': this.videosCategoryListEnabled,
      'videosListEnabledByVideosCategoryIdList': this.videosListEnabledByVideosCategoryIdList,
      'videosCategoryIndexVideosIndex': this.videosCategoryIndexVideosIndex,

      'failure': this.failure,
    };
  }

  factory HomeState.fromMap(Map<String, dynamic> map) {
    return HomeState(
      userYorshoEntity: map['userYorshoEntity'] as UserYorshoEntity,
      videosCategoryListEnabled: map['videosCategoryListEnabled'] as List<VideosCategoryEntity>,
      videosListEnabledByVideosCategoryIdList: map['videosListEnabledByVideosCategoryIdList'] as List<VideosEntity>,
      videosCategoryIndexVideosIndex: map['videosCategoryIndexVideosIndex'] as List<List<int>>,
      homeStatus: map['homeStatus'] as HomeStatus,
      failure: map['failure'] as Failure,
    );
  }

//</editor-fold>
}

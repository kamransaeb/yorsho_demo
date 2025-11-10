part of 'home_profile_photo_bloc.dart';

enum HomeProfilePhotoStatus { initial, loading, success, failure }
enum HomeProfilePhotoImageSelectStatus { initial, loading, success, failure, }
enum HomeProfilePhotoImageUploadStatus { initial, loading, success, failure, }

class HomeProfilePhotoState extends Equatable {
  final HomeProfilePhotoStatus homeProfilePhotoStatus;
  final HomeProfilePhotoImageSelectStatus homeProfilePhotoImageSelectStatus;
  final HomeProfilePhotoImageUploadStatus homeProfilePhotoImageUploadStatus;
  final Image? profileImageFile;
  final Uint8List? profileImageBytes;
  final UserYorshoEntity userYorshoEntity;
  final Failure failure;

  @override
  List<Object?> get props => [homeProfilePhotoStatus, homeProfilePhotoImageSelectStatus, homeProfilePhotoImageUploadStatus,
    userYorshoEntity, profileImageFile, profileImageBytes, failure];

//<editor-fold desc="Data Methods">
  const HomeProfilePhotoState({
    this.homeProfilePhotoStatus = HomeProfilePhotoStatus.initial,
    this.homeProfilePhotoImageSelectStatus = HomeProfilePhotoImageSelectStatus.initial,
    this.homeProfilePhotoImageUploadStatus = HomeProfilePhotoImageUploadStatus.initial,
    required this.userYorshoEntity,
    this.profileImageFile,
    this.profileImageBytes,
    this.failure = const Failure(),
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeProfilePhotoState &&
          runtimeType == other.runtimeType &&
          homeProfilePhotoStatus == other.homeProfilePhotoStatus &&
          homeProfilePhotoImageSelectStatus == other.homeProfilePhotoImageSelectStatus &&
          homeProfilePhotoImageUploadStatus == other.homeProfilePhotoImageUploadStatus &&
          profileImageFile == other.profileImageFile &&
          profileImageBytes == other.profileImageBytes &&
          userYorshoEntity == other.userYorshoEntity &&
          failure == other.failure);

  @override
  int get hashCode =>
      homeProfilePhotoStatus.hashCode ^
      homeProfilePhotoImageSelectStatus.hashCode ^
      homeProfilePhotoImageUploadStatus.hashCode ^
      profileImageFile.hashCode ^
      profileImageBytes.hashCode ^
      userYorshoEntity.hashCode ^
      failure.hashCode;

  @override
  String toString() {
    return 'HomeProfilePhotoState{' +
        ' homeProfilePhotoStatus: $homeProfilePhotoStatus,' +
        ' homeProfilePhotoImageSelectStatus: $homeProfilePhotoImageSelectStatus,' +
        ' homeProfilePhotoImageUploadStatus: $homeProfilePhotoImageUploadStatus,' +
        ' profileImageFile: $profileImageFile,' +
        ' profileImageBytes: $profileImageBytes,' +
        ' userYorshoEntity: $userYorshoEntity,' +
        ' failure: $failure,' +
        '}';
  }

  HomeProfilePhotoState copyWith({
    HomeProfilePhotoStatus? homeProfilePhotoStatus,
    HomeProfilePhotoImageSelectStatus? homeProfilePhotoImageSelectStatus,
    HomeProfilePhotoImageUploadStatus? homeProfilePhotoImageUploadStatus,
    Image? profileImageFile,
    Uint8List? profileImageBytes,
    UserYorshoEntity? userYorshoEntity,
    Failure? failure,
  }) {
    return HomeProfilePhotoState(
      homeProfilePhotoStatus:
          homeProfilePhotoStatus ?? this.homeProfilePhotoStatus,
      homeProfilePhotoImageSelectStatus:
      homeProfilePhotoImageSelectStatus ?? this.homeProfilePhotoImageSelectStatus,
      homeProfilePhotoImageUploadStatus:
      homeProfilePhotoImageUploadStatus ?? this.homeProfilePhotoImageUploadStatus,
      profileImageFile: profileImageFile ,
      profileImageBytes: profileImageBytes ,
      userYorshoEntity: userYorshoEntity ?? this.userYorshoEntity,
      failure: failure ?? this.failure,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'homeProfilePhotoStatus': this.homeProfilePhotoStatus,
      'homeProfilePhotoImageSelectStatus': this.homeProfilePhotoImageSelectStatus,
      'homeProfilePhotoImageUploadStatus': this.homeProfilePhotoImageUploadStatus,
      'profileImageFile': this.profileImageFile,
      'profileImageBytes': this.profileImageBytes,
      'userYorshoEntity': this.userYorshoEntity,
      'failure': this.failure,
    };
  }

  factory HomeProfilePhotoState.fromMap(Map<String, dynamic> map) {
    return HomeProfilePhotoState(
      homeProfilePhotoStatus:
          map['homeProfilePhotoStatus'] as HomeProfilePhotoStatus,
      homeProfilePhotoImageSelectStatus:
          map['homeProfilePhotoImageSelectStatus'] as HomeProfilePhotoImageSelectStatus,
      homeProfilePhotoImageUploadStatus:
          map['homeProfilePhotoImageUploadStatus'] as HomeProfilePhotoImageUploadStatus,
      profileImageFile: map['profileImageFile'] as Image,
      profileImageBytes: map['profileImageBytes'] as Uint8List,
      userYorshoEntity: map['userYorshoEntity'] as UserYorshoEntity,
      failure: map['failure'] as Failure,
    );
  }

//</editor-fold>
}

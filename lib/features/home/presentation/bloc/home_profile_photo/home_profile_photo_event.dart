part of 'home_profile_photo_bloc.dart';

abstract class HomeProfilePhotoEvent extends Equatable {
  const HomeProfilePhotoEvent();

  @override
  List<Object?> get props => [];
}

final class HomeProfilePhotoEventFetched extends HomeProfilePhotoEvent {
  final UserYorshoEntity userYorshoEntity;
  const HomeProfilePhotoEventFetched({required this.userYorshoEntity});
}


final class HomeProfilePhotoEventProfileImageSaved extends HomeProfilePhotoEvent {
  const HomeProfilePhotoEventProfileImageSaved();
}

final class HomeProfilePhotoEventProfileImageGallerySelected extends HomeProfilePhotoEvent {
  const HomeProfilePhotoEventProfileImageGallerySelected();
}

final class HomeProfilePhotoEventProfileImageCameraSelected extends HomeProfilePhotoEvent {
  const HomeProfilePhotoEventProfileImageCameraSelected();
}

final class HomeProfilePhotoEventProfileImageDeleted extends HomeProfilePhotoEvent {
  const HomeProfilePhotoEventProfileImageDeleted();
}



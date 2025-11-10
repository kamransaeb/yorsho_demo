import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../../../../bootstrap.dart';
import '../../../../../core/constants/cache_client_keys/cache_client_keys.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../data/authentication/models/my_user.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../services/cache_client_service/cache_client_service.dart';
import '../../../../../services/firebase_service/firebase_service.dart';
import '../../../../../utils/image_file_loader.dart';
import 'dart:convert';

part 'home_profile_photo_event.dart';
part 'home_profile_photo_state.dart';

class HomeProfilePhotoBloc
    extends Bloc<HomeProfilePhotoEvent, HomeProfilePhotoState> {
  final CacheClientService _cacheClientService;
  final FirebaseService _firebaseService;

  HomeProfilePhotoBloc(
      {
      required CacheClientService cacheClientService,
        required FirebaseService firebaseService,
      })
      :
        _cacheClientService = cacheClientService,
        _firebaseService = firebaseService,
        super(
          const HomeProfilePhotoState(
            userYorshoEntity: UserYorshoEntity.empty,
          ),
        ) {
    on<HomeProfilePhotoEventFetched>(_onHomeProfilePhotoEventFetched);
    on<HomeProfilePhotoEventProfileImageSaved>(
        _onHomeProfilePhotoEventProfileImageSaved);
    on<HomeProfilePhotoEventProfileImageGallerySelected>(
        _onHomeProfilePhotoEventProfileImageGallerySelected);
    on<HomeProfilePhotoEventProfileImageCameraSelected>(
        _onHomeProfilePhotoEventProfileImageCameraSelected);
    on<HomeProfilePhotoEventProfileImageDeleted>(
        _onHomeProfilePhotoEventProfileImageDeleted);
  }

  _onHomeProfilePhotoEventProfileImageSaved(
      HomeProfilePhotoEventProfileImageSaved event,
      Emitter<HomeProfilePhotoState> emit) async {

    emit(
      state.copyWith(
        userYorshoEntity: state.userYorshoEntity,
        profileImageFile: state.profileImageFile,
        profileImageBytes: state.profileImageBytes,
        homeProfilePhotoImageUploadStatus: HomeProfilePhotoImageUploadStatus.loading,
        homeProfilePhotoStatus: HomeProfilePhotoStatus.loading,

      ),
    );

    if (state.profileImageBytes == null) {
      emit(
        state.copyWith(
          userYorshoEntity: state.userYorshoEntity.copyWith(profileImageUrl: ''),
          profileImageFile: null,
          profileImageBytes: null,
          homeProfilePhotoImageUploadStatus: HomeProfilePhotoImageUploadStatus.initial,
          homeProfilePhotoStatus: HomeProfilePhotoStatus.success,
        ),
      );
      return;
    }

    String imageUid = const Uuid().v4();
    MyUser? myUser =
        _cacheClientService.read<MyUser>(key: CacheClientKeys.myUserCacheKey);
    //String uid = myUser == null ? 'unknown_uid' : myUser.uid;

    if (myUser == null) return;
    String? response = await _firebaseService.uploadImageForUser(myUser, '$imageUid.jpg', state.profileImageBytes!);

    if (response != null) {

      emit(
        state.copyWith(
          userYorshoEntity: state.userYorshoEntity.copyWith(
            profileImageUrl: response,
          ),
          profileImageFile: state.profileImageFile,
          profileImageBytes: state.profileImageBytes,
          homeProfilePhotoImageUploadStatus: HomeProfilePhotoImageUploadStatus.success,
          homeProfilePhotoStatus: HomeProfilePhotoStatus.success,
        ),
      );
    } else if (response == null) {
      emit(
        state.copyWith(
          userYorshoEntity: state.userYorshoEntity,
          profileImageFile: state.profileImageFile,
          profileImageBytes: state.profileImageBytes,
          homeProfilePhotoImageUploadStatus: HomeProfilePhotoImageUploadStatus.failure,
          homeProfilePhotoStatus: HomeProfilePhotoStatus.failure,
          failure: const Failure(
              status: FailureStatus.none, message: 'failure_upload_image'),
        ),
      );
    }
  }

  _onHomeProfilePhotoEventProfileImageDeleted(
      HomeProfilePhotoEventProfileImageDeleted event,
      Emitter<HomeProfilePhotoState> emit) async {
    emit(
      state.copyWith(
        userYorshoEntity: state.userYorshoEntity,
        homeProfilePhotoImageSelectStatus:
            HomeProfilePhotoImageSelectStatus.success,
        profileImageFile: null,
        profileImageBytes: null,
      ),
    );
  }

  _onHomeProfilePhotoEventProfileImageGallerySelected(
      HomeProfilePhotoEventProfileImageGallerySelected event,
      Emitter<HomeProfilePhotoState> emit) async {
    final ImagePicker imagePicker = ImagePicker();
    Uint8List? imageBytes;

    final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        //requestFullMetadata: false,
        imageQuality: 85);

    if (pickedFile != null) {
      imageBytes = await pickedFile.readAsBytes();
    } else {
      emit(
        state.copyWith(
          userYorshoEntity: state.userYorshoEntity,
          profileImageFile: state.profileImageFile,
          profileImageBytes: state.profileImageBytes,
          homeProfilePhotoImageSelectStatus: HomeProfilePhotoImageSelectStatus.failure,
          failure: const Failure(status: FailureStatus.none, message: 'failure_select_image'),
        ),
      );
    }

    if (imageBytes != null) {
      Image imageFile = Image.memory(
        imageBytes,
        width: 1200,
      //  filterQuality: FilterQuality.medium,
        fit: BoxFit.cover,
      );

      emit(
        state.copyWith(
          userYorshoEntity: state.userYorshoEntity,
          homeProfilePhotoImageSelectStatus: HomeProfilePhotoImageSelectStatus.success,
          profileImageFile: imageFile,
          profileImageBytes: imageBytes,
        ),
      );
    }
  }

  _onHomeProfilePhotoEventProfileImageCameraSelected(
      HomeProfilePhotoEventProfileImageCameraSelected event,
      Emitter<HomeProfilePhotoState> emit) async {
    final ImagePicker imagePicker = ImagePicker();
    Uint8List? imageBytes;

    final pickedFile = await imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1200,
        //requestFullMetadata: false,
        imageQuality: 85);

    if (pickedFile != null) {
      imageBytes = await pickedFile.readAsBytes();
    } else {
      emit(
        state.copyWith(
          userYorshoEntity: state.userYorshoEntity,
          profileImageFile: state.profileImageFile,
          profileImageBytes: state.profileImageBytes,
          homeProfilePhotoImageSelectStatus: HomeProfilePhotoImageSelectStatus.failure,
          failure: const Failure(status: FailureStatus.none, message: 'failure_select_image'),
        ),
      );
    }

    if (imageBytes != null) {
      Image imageFile = Image.memory(
        imageBytes,
        width: 1200,
        filterQuality: FilterQuality.medium,
        fit: BoxFit.cover,
      );
      emit(
        state.copyWith(
          userYorshoEntity: state.userYorshoEntity,
          homeProfilePhotoImageSelectStatus: HomeProfilePhotoImageSelectStatus.success,
          profileImageFile: imageFile,
          profileImageBytes: imageBytes,
        ),
      );
    }
  }

  _onHomeProfilePhotoEventFetched(HomeProfilePhotoEventFetched event,
      Emitter<HomeProfilePhotoState> emit) async {
    Image? imageFile;

    if (event.userYorshoEntity.profileImageUrl != null && event.userYorshoEntity.profileImageUrl != '') {
      imageFile =
          loadImageFileFromUrl(url: event.userYorshoEntity.profileImageUrl);
    }

    emit(
      state.copyWith(
        userYorshoEntity: event.userYorshoEntity,
        homeProfilePhotoStatus: HomeProfilePhotoStatus.initial,
        homeProfilePhotoImageSelectStatus: HomeProfilePhotoImageSelectStatus.initial,
        homeProfilePhotoImageUploadStatus: HomeProfilePhotoImageUploadStatus.initial,
        profileImageFile: imageFile,
      ),
    );
  }
}

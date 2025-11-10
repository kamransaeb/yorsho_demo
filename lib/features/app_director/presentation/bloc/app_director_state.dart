part of 'app_director_bloc.dart';

enum AppDirectorStatus { initial, loading, success, failure }

class AppDirectorState extends Equatable {

  final AppDirectorStatus appDirectorStatus;
  final Failure failure;
  final bool isFirstUse;
  final UserYorshoEntity userYorshoEntity;
  final String updateAppStoreUrlEn;
  final String updateAppStoreUrlTr;
  final bool isAppUpdate;

  const AppDirectorState({
    this.appDirectorStatus = AppDirectorStatus.initial,
    this.failure = const Failure(),
    this.isFirstUse = true,
    required this.userYorshoEntity,
    this.updateAppStoreUrlEn = '',
    this.updateAppStoreUrlTr = '',
    this.isAppUpdate = true,
  });

  @override
  List<Object?> get props => [failure, isFirstUse,
    updateAppStoreUrlEn,
    updateAppStoreUrlTr,
    isAppUpdate,
    appDirectorStatus, userYorshoEntity];

//<editor-fold desc="Data Methods">

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AppDirectorState &&
              runtimeType == other.runtimeType &&
              appDirectorStatus == other.appDirectorStatus &&
              failure == other.failure &&
              updateAppStoreUrlEn == other.updateAppStoreUrlEn &&
              updateAppStoreUrlTr == other.updateAppStoreUrlTr &&
              isAppUpdate == other.isAppUpdate &&
              isFirstUse == other.isFirstUse &&
              userYorshoEntity == other.userYorshoEntity);

  @override
  int get hashCode =>
      appDirectorStatus.hashCode ^
      failure.hashCode ^
      updateAppStoreUrlEn.hashCode ^
      updateAppStoreUrlTr.hashCode ^
      isAppUpdate.hashCode ^
      isFirstUse.hashCode ^
      userYorshoEntity.hashCode;

  @override
  String toString() {
    return 'AppDirectorState{' +
        ' appDirectorStatus: $appDirectorStatus,' +
        ' failure: $failure,' +
        ' isFirstUse: $isFirstUse,' +
        ' updateAppStoreUrlEn: $updateAppStoreUrlEn,' +
        ' updateAppStoreUrlTr: $updateAppStoreUrlTr,' +
        ' isAppUpdate: $isAppUpdate,' +
        ' userYorshoEntity: $userYorshoEntity,' +
        '}';
  }

  AppDirectorState copyWith({
    AppDirectorStatus? appDirectorStatus,
    Failure? failure,
    bool? isFirstUse,
    String? updateAppStoreUrlEn,
    String? updateAppStoreUrlTr,
    bool? isAppUpdate,
    UserYorshoEntity? userYorshoEntity,
  }) {
    return AppDirectorState(
      appDirectorStatus: appDirectorStatus ?? this.appDirectorStatus,
      failure: failure ?? this.failure,
      isFirstUse: isFirstUse ?? this.isFirstUse,
      updateAppStoreUrlEn: updateAppStoreUrlEn ?? this.updateAppStoreUrlEn,
      updateAppStoreUrlTr: updateAppStoreUrlTr ?? this.updateAppStoreUrlTr,
      isAppUpdate: isAppUpdate ?? this.isAppUpdate,
      userYorshoEntity: userYorshoEntity ?? this.userYorshoEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appDirectorStatus': this.appDirectorStatus,
      'failure': this.failure,
      'isFirstUse': this.isFirstUse,
      'updateAppStoreUrlEn': this.updateAppStoreUrlEn,
      'updateAppStoreUrlTr': this.updateAppStoreUrlTr,
      'isAppUpdate': this.isAppUpdate,
      'userYorshoEntity': this.userYorshoEntity,
    };
  }

  factory AppDirectorState.fromMap(Map<String, dynamic> map) {
    return AppDirectorState(
      appDirectorStatus: map['appDirectorStatus'] as AppDirectorStatus,
      failure: map['failure'] as Failure,
      isFirstUse: map['isFirstUse'] as bool,
      updateAppStoreUrlEn: map['updateAppStoreUrlEn'] as String,
      updateAppStoreUrlTr: map['updateAppStoreUrlTr'] as String,
      isAppUpdate: map['isAppUpdate'] as bool,
      userYorshoEntity: map['userYorshoEntity'] as UserYorshoEntity,
    );
  }

//</editor-fold>
}
import 'package:yorsho_mobile_branded_dev/core/extensions/extensions.dart';

import '../../data/videos/models/videos_model.dart';
import '../../utils/mapper/entity_to_model_mapper.dart';

class VideosEntity implements EntityToModelMapper<VideosModel>{

  final int? id;
  final int? videosCategoryId;
  final DateTime? createDate;
  final DateTime? updateDate;
  final String nameTr;
  final String nameEn;
  final String title;
  final String descriptionTr;
  final String descriptionEn;
  final String? imageUrl;
  final String? videoUrl;
  final bool free;
  final bool enabled;
  final int? minutes;

//<editor-fold desc="Data Methods">
  const VideosEntity({
    this.id,
    this.videosCategoryId,
    this.createDate,
    this.updateDate,
    required this.nameTr,
    required this.nameEn,
    required this.title,
    required this.descriptionTr,
    required this.descriptionEn,
    this.imageUrl,
    this.videoUrl,
    required this.free,
    required this.enabled,
    this.minutes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VideosEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          videosCategoryId == other.videosCategoryId &&
          updateDate == other.updateDate &&
          createDate == other.createDate &&
          nameTr == other.nameTr &&
          nameEn == other.nameEn &&
          title == other.title &&
          descriptionTr == other.descriptionTr &&
          descriptionEn == other.descriptionEn &&
          imageUrl == other.imageUrl &&
          videoUrl == other.videoUrl &&
          enabled == other.enabled &&
          free == other.free &&
          minutes == other.minutes);

  @override
  int get hashCode =>
      id.hashCode ^
      videosCategoryId.hashCode ^
      updateDate.hashCode ^
      createDate.hashCode ^
      nameTr.hashCode ^
      nameEn.hashCode ^
      title.hashCode ^
      imageUrl.hashCode ^
      videoUrl.hashCode ^
      enabled.hashCode ^
      descriptionTr.hashCode ^
      descriptionEn.hashCode ^
      free.hashCode ^
      minutes.hashCode;

  @override
  String toString() {
    return 'VideosEntity{' +
        ' id: $id,' +
        ' videosCategoryId: $videosCategoryId,' +
        ' updateDate: $updateDate,' +
        ' createDate: $createDate,' +
        ' nameTr: $nameTr,' +
        ' nameEn: $nameEn,' +
        ' title: $title,' +
        ' imageUrl: $imageUrl,' +
        ' videoUrl: $videoUrl,' +
        ' enabled: $enabled,' +
        ' descriptionTr: $descriptionTr,' +
        ' descriptionEn: $descriptionEn,' +
        ' free: $free,' +
        ' minutes: $minutes,' +
        '}';
  }

  VideosEntity copyWith({
    int? id,
    int? videosCategoryId,
    DateTime? createDate,
    DateTime? updateDate,
    String? nameTr,
    String? nameEn,
    String? title,
    String? descriptionTr,
    String? descriptionEn,
    String? imageUrl,
    String? videoUrl,
    bool? free,
    bool? enabled,
    int? minutes,
  }) {
    return VideosEntity(
      id: id ?? this.id,
      videosCategoryId: videosCategoryId ?? this.videosCategoryId,
      updateDate: updateDate ?? this.updateDate,
      createDate: createDate ?? this.createDate,
      nameTr: nameTr ?? this.nameTr,
      nameEn: nameEn ?? this.nameEn,
      title: title ?? this.title,
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      descriptionTr: descriptionTr ?? this.descriptionTr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      free: free ?? this.free,
      minutes: minutes,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'videosCategoryId': this.videosCategoryId,
      'updateDate': updateDate == null ? null : updateDate!.removeNanosecond.toUtc().toIso8601String(),
      'createDate': createDate == null ? null : createDate!.removeNanosecond.toUtc().toIso8601String(),
      'nameTr': this.nameTr,
      'nameEn': this.nameEn,
      'title': this.title,
      'imageUrl': this.imageUrl,
      'videoUrl': this.videoUrl,
      'descriptionTr': this.descriptionTr,
      'descriptionEn': this.descriptionEn,
      'free': this.free,
      'minutes': this.minutes,
      'enabled': this.enabled,

    };
  }

  factory VideosEntity.fromMap(Map<String, dynamic> map) {
    return VideosEntity(
      id: map['id'] == null ? null : map['id'] as int,
      videosCategoryId: map['videosCategoryId'] == null ? null : map['videosCategoryId'] as int,
      updateDate: map['updateDate'] == null ? null : DateTime.parse(map['updateDate'].toString()),
      createDate: map['createDate'] == null ? null : DateTime.parse(map['createDate'].toString()),
      nameTr: map['nameTr'] as String,
      nameEn: map['nameEn'] as String,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] == null ? null : map['imageUrl'] as String,
      videoUrl: map['videoUrl'] == null ? null : map['videoUrl'] as String,
      descriptionTr: map['descriptionTr'] as String,
      descriptionEn: map['descriptionEn'] as String,
      free: map['free'] as bool,
      minutes: map['minutes'] == null ? null : map['minutes'] as int,
      enabled: map['enabled'] as bool,
    );
  }

  @override
  VideosModel toModel() {
    return VideosModel(
      id: id,
      videosCategoryId: videosCategoryId,
      updateDate: updateDate,
      createDate: createDate,
      nameTr: nameTr,
      nameEn: nameEn,
      title: title,
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      descriptionTr: descriptionTr,
      descriptionEn: descriptionEn,
      free: free,
      minutes: minutes,
      enabled: enabled,
    );
  }

//</editor-fold>
}
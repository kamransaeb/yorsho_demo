
import 'package:yorsho_mobile_branded_dev/core/extensions/extensions.dart';

import '../../../entities/videos/videos_entity.dart';
import '../../../utils/mapper/model_to_entity_mapper.dart';

class VideosModel implements ModelToEntityMapper<VideosEntity> {

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

  @override
  VideosEntity toEntity() {
    return VideosEntity(
      id: id,
      videosCategoryId: videosCategoryId,
      createDate: createDate,
      updateDate: updateDate,
      nameTr: nameTr,
      nameEn: nameEn,
      title: title,
      descriptionTr: descriptionTr,
      descriptionEn: descriptionEn,
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      minutes: minutes,
      free: free,
      enabled: enabled,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'videosCategoryId': this.videosCategoryId,
      'createDate': createDate == null ? null : createDate!.removeNanosecond.toUtc().toIso8601String(),
      'updateDate': updateDate == null ? null : updateDate!.removeNanosecond.toUtc().toIso8601String(),
      'nameTr': this.nameTr,
      'nameEn': this.nameEn,
      'title': this.title,
      'descriptionTr': this.descriptionTr,
      'descriptionEn': this.descriptionEn,
      'imageUrl': this.imageUrl,
      'videoUrl': this.videoUrl,
      'minutes': this.minutes,
      'free': this.free,
      'enabled': this.enabled,
    };
  }

  factory VideosModel.fromJson(Map<String, dynamic> map) {

    return VideosModel(
      id: map['id'] == null ? null : map['id'] as int,
      videosCategoryId: map['videosCategoryId'] == null ? null : map['videosCategoryId'] as int,
      createDate: map['createDate'] == null ? null : DateTime.parse(map['createDate'].toString()),
      updateDate: map['updateDate'] == null ? null : DateTime.parse(map['updateDate'].toString()),
      nameTr: map['nameTr'] as String,
      nameEn: map['nameEn'] as String,
      title: map['title'] as String,
      descriptionTr: map['descriptionTr'] as String,
      descriptionEn: map['descriptionEn'] as String,
      imageUrl: map['imageUrl'] == null ? null : map['imageUrl'] as String,
      videoUrl: map['videoUrl'] == null ? null : map['videoUrl'] as String,
      minutes: map['minutes'] == null ? null : map['minutes'] as int,
      free: map['free'] as bool,
      enabled: map['enabled'] as bool,
    );
  }

//<editor-fold desc="Data Methods">
  const VideosModel({
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
    return 'VideosModel{' +
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

  VideosModel copyWith({
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
    return VideosModel(
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

//</editor-fold>
}

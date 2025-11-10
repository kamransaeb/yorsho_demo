import 'package:yorsho_mobile_branded_dev/core/extensions/extensions.dart';

import '../../../entities/videos_category/videos_category_entity.dart';
import '../../../utils/mapper/model_to_entity_mapper.dart';

class VideosCategoryModel implements ModelToEntityMapper<VideosCategoryEntity> {
  final int? id;
  final DateTime? createDate;
  final DateTime? updateDate;
  final String nameTr;
  final String nameEn;
  final String title;
  final String descriptionTr;
  final String descriptionEn;
  final bool enabled;

  @override
  VideosCategoryEntity toEntity() {
    return VideosCategoryEntity(
      id: id,
      createDate: createDate,
      updateDate: updateDate,
      nameTr: nameTr,
      nameEn: nameEn,
      title: title,
      descriptionTr: descriptionTr,
      descriptionEn: descriptionEn,
      enabled: enabled,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'createDate': createDate == null ? null : createDate!.removeNanosecond.toUtc().toIso8601String(),
      'updateDate': updateDate == null ? null : updateDate!.removeNanosecond.toUtc().toIso8601String(),
      'nameTr': this.nameTr,
      'nameEn': this.nameEn,
      'title': this.title,
      'descriptionTr': this.descriptionTr,
      'descriptionEn': this.descriptionEn,
      'enabled': this.enabled,
    };
  }

  factory VideosCategoryModel.fromJson(Map<String, dynamic> map) {

    return VideosCategoryModel(
      id: map['id'] as int,
      createDate: map['createDate'] == null ? null : DateTime.parse(map['createDate'].toString()),
      updateDate: map['updateDate'] == null ? null : DateTime.parse(map['updateDate'].toString()),
      nameTr: map['nameTr'] as String,
      nameEn: map['nameEn'] as String,
      title: map['title'] as String,
      descriptionTr: map['descriptionTr'] as String,
      descriptionEn: map['descriptionEn'] as String,
      enabled: map['enabled'] as bool,
    );
  }

//<editor-fold desc="Data Methods">
  const VideosCategoryModel({
    this.id,
    this.createDate,
    this.updateDate,
    required this.nameTr,
    required this.nameEn,
    required this.title,
    required this.descriptionTr,
    required this.descriptionEn,
    required this.enabled,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is VideosCategoryModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              createDate == other.createDate &&
              updateDate == other.updateDate &&
              title == other.title &&
              nameTr == other.nameTr &&
              nameEn == other.nameEn &&
              descriptionTr == other.descriptionTr &&
              descriptionEn == other.descriptionEn &&
              enabled == other.enabled
          );

  @override
  int get hashCode =>
      id.hashCode ^
      createDate.hashCode ^
      updateDate.hashCode ^
      nameTr.hashCode ^
      nameEn.hashCode ^
      title.hashCode ^
      descriptionTr.hashCode ^
      descriptionEn.hashCode ^
      enabled.hashCode;

  @override
  String toString() {
    return 'VideosCategoryModel{' +
        ' id: $id,' +
        ' createDate: $createDate,' +
        ' updateDate: $updateDate,' +
        ' nameTr: $nameTr,' +
        ' nameEn: $nameEn,' +
        ' title: $title,' +
        ' descriptionTr: $descriptionTr,' +
        ' descriptionEn: $descriptionEn,' +
        ' enabled: $enabled,' +
        '}';
  }

  VideosCategoryModel copyWith({
    int? id,
    DateTime? createDate,
    DateTime? updateDate,
    String? nameTr,
    String? nameEn,
    String? title,
    String? descriptionTr,
    String? descriptionEn,
    bool? enabled,
  }) {
    return VideosCategoryModel(
      id: id ?? this.id,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      nameTr: nameTr ?? this.nameTr,
      nameEn: nameEn ?? this.nameEn,
      title: title ?? this.title,
      enabled: enabled ?? this.enabled,
      descriptionTr: descriptionTr ?? this.descriptionTr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
    );
  }

//</editor-fold>
}

import 'package:yorsho_mobile_branded_dev/core/extensions/extensions.dart';

import '../../data/videos_category/models/videos_category_model.dart';
import '../../utils/mapper/entity_to_model_mapper.dart';

class VideosCategoryEntity implements EntityToModelMapper<VideosCategoryModel>{

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
  VideosCategoryModel toModel() {
    return VideosCategoryModel(
      id: id,
      createDate: createDate,
      updateDate: updateDate,
      title: title,
      nameEn: nameEn,
      nameTr: nameTr,
      descriptionEn: descriptionEn,
      descriptionTr: descriptionTr,
      enabled: enabled,
    );
  }

//<editor-fold desc="Data Methods">
  const VideosCategoryEntity({
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
      (other is VideosCategoryEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createDate == other.createDate &&
          updateDate == other.updateDate &&
          nameTr == other.nameTr &&
          nameEn == other.nameEn &&
          title == other.title &&
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
      enabled.hashCode ^
      descriptionTr.hashCode ^
      descriptionEn.hashCode;

  @override
  String toString() {
    return 'VideosCategoryEntity{' +
        ' id: $id,' +
        ' createDate: $createDate,' +
        ' updateDate: $updateDate,' +
        ' nameTr: $nameTr,' +
        ' nameEn: $nameEn,' +
        ' title: $title,' +
        ' enabled: $enabled,' +
        ' descriptionTr: $descriptionTr,' +
        ' descriptionEn: $descriptionEn,' +
        '}';
  }

  VideosCategoryEntity copyWith({
    int? id,
    DateTime? createDate,
    DateTime? updateDate,
    String? nameTr,
    String? nameEn,
    String? title,
    bool? enabled,
    String? descriptionTr,
    String? descriptionEn,
  }) {
    return VideosCategoryEntity(
      id: id ?? this.id,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      nameTr: nameTr ?? this.nameTr,
      nameEn: nameEn ?? this.nameEn,
      title: title ?? this.title,
      descriptionTr: descriptionTr ?? this.descriptionTr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
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

  factory VideosCategoryEntity.fromMap(Map<String, dynamic> map) {
    return VideosCategoryEntity(
      id: map['id'] == null ? null : map['id'] as int,
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

//</editor-fold>
}
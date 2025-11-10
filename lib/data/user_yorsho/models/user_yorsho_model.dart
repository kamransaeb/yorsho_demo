import 'dart:convert';

import '../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../utils/mapper/model_to_entity_mapper.dart';

class UserYorshoModel implements ModelToEntityMapper<UserYorshoEntity> {

  final int id;
  final String uid;
  final String name;
  final String surname;
  final String email;
  final String? personalPhoneNumber;
  final String? address;
  final int userYorshoAccountType;
  final String? notificationToken;
  final bool enabled;
  final bool profileCompleted;
  final String languageCode;
  final bool verified;
  final String? turkishIdentificationNumber;
  final bool forceLogout;
  final String? profileImageUrl;
  final DateTime? birthDate;
  final int? gender;

//<editor-fold desc="Data Methods">
  const UserYorshoModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.surname,
    required this.email,
    this.personalPhoneNumber,
    this.address,
    required this.userYorshoAccountType,
    this.notificationToken,
    required this.enabled,
    required this.profileCompleted,
    required this.languageCode,
    required this.verified,
    this.turkishIdentificationNumber,
    required this.forceLogout,
    this.profileImageUrl,
    this.birthDate,
    this.gender,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is UserYorshoModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              uid == other.uid &&
              name == other.name &&
              surname == other.surname &&
              email == other.email &&
              personalPhoneNumber == other.personalPhoneNumber &&
              address == other.address &&
              userYorshoAccountType == other.userYorshoAccountType &&
              notificationToken == other.notificationToken &&
              enabled == other.enabled &&
              profileCompleted == other.profileCompleted &&
              languageCode == other.languageCode &&
              verified == other.verified &&
              turkishIdentificationNumber == other.turkishIdentificationNumber &&
              profileImageUrl == other.profileImageUrl &&
              birthDate == other.birthDate &&
              gender == other.gender &&
              forceLogout == other.forceLogout);

  @override
  int get hashCode =>
      id.hashCode ^
      uid.hashCode ^
      name.hashCode ^
      surname.hashCode ^
      email.hashCode ^
      personalPhoneNumber.hashCode ^
      address.hashCode ^
      userYorshoAccountType.hashCode ^
      notificationToken.hashCode ^
      enabled.hashCode ^
      profileCompleted.hashCode ^
      languageCode.hashCode ^
      verified.hashCode ^
      turkishIdentificationNumber.hashCode ^
      profileImageUrl.hashCode ^
      birthDate.hashCode ^
      gender.hashCode ^
      forceLogout.hashCode;

  @override
  String toString() {
    return 'UserYorshoModel{' +
        ' id: $id,' +
        ' uid: $uid,' +
        ' name: $name,' +
        ' surname: $surname,' +
        ' email: $email,' +
        ' personalPhoneNumber: $personalPhoneNumber,' +
        ' address: $address,' +
        ' userYorshoAccountType: $userYorshoAccountType,' +
        ' notificationToken: $notificationToken,' +
        ' enabled: $enabled,' +
        ' profileCompleted: $profileCompleted,' +
        ' languageCode: $languageCode,' +
        ' verified: $verified,' +
        ' turkishIdentificationNumber: $turkishIdentificationNumber,' +
        ' forceLogout: $forceLogout,' +
        ' birthDate: $birthDate,' +
        ' gender: $gender,' +
        ' profileImageUrl: $profileImageUrl,' +
        '}';
  }

  UserYorshoModel copyWith({
    int? id,
    String? uid,
    String? name,
    String? surname,
    String? email,
    String? personalPhoneNumber,
    String? address,
    int? userYorshoAccountType,
    String? notificationToken,
    bool? enabled,
    bool? profileCompleted,
    String? languageCode,
    bool? verified,
    String? turkishIdentificationNumber,
    String? profileImageUrl,
    bool? forceLogout,
    DateTime? birthDate,
    int? gender,
  }) {
    return UserYorshoModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      personalPhoneNumber: personalPhoneNumber ?? this.personalPhoneNumber,
      address: address ?? this.address,
      userYorshoAccountType: userYorshoAccountType ?? this.userYorshoAccountType,
      notificationToken: notificationToken ?? this.notificationToken,
      enabled: enabled ?? this.enabled,
      profileCompleted: profileCompleted ?? this.profileCompleted,
      languageCode: languageCode ?? this.languageCode,
      verified: verified ?? this.verified,
      turkishIdentificationNumber: turkishIdentificationNumber ?? this.turkishIdentificationNumber,
      forceLogout: forceLogout ?? this.forceLogout,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'uid': this.uid,
      'name': this.name,
      'surname': this.surname,
      'email': this.email,
      'personalPhoneNumber': this.personalPhoneNumber,
      'address': this.address,
      'userYorshoAccountType': this.userYorshoAccountType,
      'notificationToken': this.notificationToken,
      'enabled': this.enabled,
      'profileCompleted': this.profileCompleted,
      'languageCode': this.languageCode,
      'verified': this.verified,
      'turkishIdentificationNumber': this.turkishIdentificationNumber,
      'forceLogout': this.forceLogout,
      'profileImageUrl': this.profileImageUrl,
      'birthDate': this.birthDate == null ? null :  this.birthDate!.toIso8601String(),
      'gender': this.gender,
    };
  }

  factory UserYorshoModel.fromJson(Map<String, dynamic> map) {
    return UserYorshoModel(
      id: map['id'] as int,
      uid: map['uid'] as String,
      name: map['name'] == null  ? '' :  map['name'] as String,
      surname: map['surname'] == null ? '' : map['surname'] as String,
      email: map['email'] as String,
      personalPhoneNumber: map['personalPhoneNumber'] == null ? null : map['personalPhoneNumber'] as String,
      address: map['address'] == null ? null : map['address'] as String,
      userYorshoAccountType: map['userYorshoAccountType'] as int,
      notificationToken: map['notificationToken'] == null ? null : map['notificationToken'] as String,
      enabled: map['enabled'] as bool,
      profileCompleted: map['profileCompleted'] as bool,
//      createDate: map['createDate'] as DateTime,
      languageCode: map['languageCode'] as String,
      verified: map['verified'] as bool,
      turkishIdentificationNumber: map['turkishIdentificationNumber'] == null ? null : map['turkishIdentificationNumber'] as String,
      profileImageUrl: map['profileImageUrl'] == null ? null : map['profileImageUrl'] as String,
      forceLogout: map['forceLogout'] as bool,
      birthDate: map['birthDate'] == null ? null : DateTime.parse(map['birthDate'].toString()),
      gender: map['gender'] == null ? null : map['gender'] as int,
    );
  }

  @override
  UserYorshoEntity toEntity() {
    return UserYorshoEntity(
      id: id,
      uid: uid,
      name: name,
      surname: surname,
      email: email,
      personalPhoneNumber: personalPhoneNumber,
      address: address,
      userYorshoAccountType: userYorshoAccountType,
      notificationToken: notificationToken,
      enabled: enabled,
      profileCompleted: profileCompleted,
      languageCode: languageCode,
      verified: verified,
      turkishIdentificationNumber: turkishIdentificationNumber,
      profileImageUrl: profileImageUrl,
      forceLogout: forceLogout,
      birthDate: birthDate,
      gender: gender,
    );
  }

//</editor-fold>
}



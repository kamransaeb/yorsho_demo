class AppDataEntity {
  final int id;
  final String buildNumber;
  final String appVersion;
  final String storeUrlEn;
  final String storeUrlTr;
  final String? bucketUrl;
  final String? bucketName;
  final String? bucketFolder;
  final String? cloudUrl;
  final String? purchaseCallbackUrl;
  final String? kvkkPrivacyPolicyEn;
  final String? kvkkPrivacyPolicyTr;
  final String? onlineSalesAgreementEn;
  final String? onlineSalesAgreementTr;
  final String? userConsentConfirmationFormEn;
  final String? userConsentConfirmationFormTr;
  final String? userAgreementsEn;
  final String? userAgreementsTr;
  final String? personalDataProtectionEn;
  final String? personalDataProtectionTr;
  final int? kdvTaxPercentage;
  final bool? forceUpdate;

  final double? basketShippingFee;
  final double? basketShippingNoFeeLimit;

  final int? basketItemCounterLimit;


//<editor-fold desc="Data Methods">
  const AppDataEntity({
    required this.id,
    required this.buildNumber,
    required this.appVersion,
    required this.storeUrlEn,
    required this.storeUrlTr,
    this.bucketUrl,
    this.bucketName,
    this.bucketFolder,
    this.cloudUrl,
    this.purchaseCallbackUrl,
    this.kvkkPrivacyPolicyEn,
    this.kvkkPrivacyPolicyTr,
    this.onlineSalesAgreementEn,
    this.onlineSalesAgreementTr,
    this.userConsentConfirmationFormEn,
    this.userConsentConfirmationFormTr,
    this.userAgreementsEn,
    this.userAgreementsTr,
    this.personalDataProtectionEn,
    this.personalDataProtectionTr,
    this.kdvTaxPercentage,
    this.forceUpdate,

    this.basketShippingFee,
    this.basketShippingNoFeeLimit,

    this.basketItemCounterLimit,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AppDataEntity &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              buildNumber == other.buildNumber &&
              appVersion == other.appVersion &&
              storeUrlEn == other.storeUrlEn &&
              storeUrlTr == other.storeUrlTr &&
              bucketUrl == other.bucketUrl &&
              bucketName == other.bucketName &&
              bucketFolder == other.bucketFolder &&
              cloudUrl == other.cloudUrl &&
              purchaseCallbackUrl == other.purchaseCallbackUrl &&
              kvkkPrivacyPolicyEn == other.kvkkPrivacyPolicyEn &&
              kvkkPrivacyPolicyTr == other.kvkkPrivacyPolicyTr &&
              onlineSalesAgreementEn == other.onlineSalesAgreementEn &&
              onlineSalesAgreementTr == other.onlineSalesAgreementTr &&
              userConsentConfirmationFormEn ==
                  other.userConsentConfirmationFormEn &&
              userConsentConfirmationFormTr ==
                  other.userConsentConfirmationFormTr &&
              userAgreementsEn == other.userAgreementsEn &&
              userAgreementsTr == other.userAgreementsTr &&
              personalDataProtectionEn == other.personalDataProtectionEn &&
              personalDataProtectionTr == other.personalDataProtectionTr &&

              basketShippingFee == other.basketShippingFee &&
              basketShippingNoFeeLimit == other.basketShippingNoFeeLimit &&

              basketItemCounterLimit == other.basketItemCounterLimit &&

              kdvTaxPercentage == other.kdvTaxPercentage &&
              forceUpdate == other.forceUpdate);

  @override
  int get hashCode =>
      id.hashCode ^
      buildNumber.hashCode ^
      appVersion.hashCode ^
      storeUrlEn.hashCode ^
      storeUrlTr.hashCode ^
      bucketUrl.hashCode ^
      bucketName.hashCode ^
      bucketFolder.hashCode ^
      cloudUrl.hashCode ^
      purchaseCallbackUrl.hashCode ^
      kvkkPrivacyPolicyEn.hashCode ^
      kvkkPrivacyPolicyTr.hashCode ^
      onlineSalesAgreementEn.hashCode ^
      onlineSalesAgreementTr.hashCode ^
      userConsentConfirmationFormEn.hashCode ^
      userConsentConfirmationFormTr.hashCode ^
      userAgreementsEn.hashCode ^
      userAgreementsTr.hashCode ^
      personalDataProtectionEn.hashCode ^
      personalDataProtectionTr.hashCode ^

      basketShippingFee.hashCode ^
      basketShippingNoFeeLimit.hashCode ^

      basketItemCounterLimit.hashCode ^

      kdvTaxPercentage.hashCode ^
      forceUpdate.hashCode;

  @override
  String toString() {
    return 'AppDataEntity{' +
        ' id: $id,' +
        ' buildNumber: $buildNumber,' +
        ' appVersion: $appVersion,' +
        ' storeUrlEn: $storeUrlEn,' +
        ' storeUrlTr: $storeUrlTr,' +
        ' bucketUrl: $bucketUrl,' +
        ' bucketName: $bucketName,' +
        ' bucketFolder: $bucketFolder,' +
        ' cloudUrl: $cloudUrl,' +
        ' purchaseCallbackUrl: $purchaseCallbackUrl,' +
        ' kvkkPrivacyPolicyEn: $kvkkPrivacyPolicyEn,' +
        ' kvkkPrivacyPolicyTr: $kvkkPrivacyPolicyTr,' +
        ' onlineSalesAgreementEn: $onlineSalesAgreementEn,' +
        ' onlineSalesAgreementTr: $onlineSalesAgreementTr,' +
        ' userConsentConfirmationFormEn: $userConsentConfirmationFormEn,' +
        ' userConsentConfirmationFormTr: $userConsentConfirmationFormTr,' +
        ' userAgreementsEn: $userAgreementsEn,' +
        ' userAgreementsTr: $userAgreementsTr,' +
        ' personalDataProtectionEn: $personalDataProtectionEn,' +
        ' personalDataProtectionTr: $personalDataProtectionTr,' +

        ' basketShippingFee: $basketShippingFee,' +
        ' basketShippingNoFeeLimit: $basketShippingNoFeeLimit,' +

        ' basketItemCounterLimit: $basketItemCounterLimit,' +

        ' kdvTaxPercentage: $kdvTaxPercentage,' +
        ' forceUpdate: $forceUpdate,' +
        '}';
  }

  AppDataEntity copyWith({
    int? id,
    String? buildNumber,
    String? appVersion,
    String? storeUrlEn,
    String? storeUrlTr,
    String? bucketUrl,
    String? bucketName,
    String? bucketFolder,
    String? cloudUrl,
    String? purchaseCallbackUrl,
    String? kvkkPrivacyPolicyEn,
    String? kvkkPrivacyPolicyTr,
    String? onlineSalesAgreementEn,
    String? onlineSalesAgreementTr,
    String? userConsentConfirmationFormEn,
    String? userConsentConfirmationFormTr,
    String? userAgreementsEn,
    String? userAgreementsTr,
    String? personalDataProtectionEn,
    String? personalDataProtectionTr,

    double? basketShippingFee,
    double? basketShippingNoFeeLimit,

    int? basketItemCounterLimit,

    int? kdvTaxPercentage,
    bool? forceUpdate,
  }) {
    return AppDataEntity(
      id: id ?? this.id,
      buildNumber: buildNumber ?? this.buildNumber,
      appVersion: appVersion ?? this.appVersion,
      storeUrlEn: storeUrlEn ?? this.storeUrlEn,
      storeUrlTr: storeUrlTr ?? this.storeUrlTr,
      bucketUrl: bucketUrl ?? this.bucketUrl,
      bucketName: bucketName ?? this.bucketName,
      bucketFolder: bucketFolder ?? this.bucketFolder,
      cloudUrl: cloudUrl ?? this.cloudUrl,
      purchaseCallbackUrl: purchaseCallbackUrl ?? this.purchaseCallbackUrl,
      kvkkPrivacyPolicyEn: kvkkPrivacyPolicyEn ?? this.kvkkPrivacyPolicyEn,
      kvkkPrivacyPolicyTr: kvkkPrivacyPolicyTr ?? this.kvkkPrivacyPolicyTr,
      onlineSalesAgreementEn:
      onlineSalesAgreementEn ?? this.onlineSalesAgreementEn,
      onlineSalesAgreementTr:
      onlineSalesAgreementTr ?? this.onlineSalesAgreementTr,
      userConsentConfirmationFormEn:
      userConsentConfirmationFormEn ?? this.userConsentConfirmationFormEn,
      userConsentConfirmationFormTr:
      userConsentConfirmationFormTr ?? this.userConsentConfirmationFormTr,
      userAgreementsEn: userAgreementsEn ?? this.userAgreementsEn,
      userAgreementsTr: userAgreementsTr ?? this.userAgreementsTr,

      personalDataProtectionEn: personalDataProtectionEn ?? this.personalDataProtectionEn,
      personalDataProtectionTr: personalDataProtectionTr ?? this.personalDataProtectionTr,

      basketShippingFee: basketShippingFee ?? this.basketShippingFee,
      basketShippingNoFeeLimit: basketShippingNoFeeLimit ?? this.basketShippingNoFeeLimit,

      basketItemCounterLimit: basketItemCounterLimit ?? this.basketItemCounterLimit,

      kdvTaxPercentage: kdvTaxPercentage ?? this.kdvTaxPercentage,
      forceUpdate: forceUpdate ?? this.forceUpdate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'buildNumber': this.buildNumber,
      'appVersion': this.appVersion,
      'storeUrlEn': this.storeUrlEn,
      'storeUrlTr': this.storeUrlTr,
      'bucketUrl': this.bucketUrl,
      'bucketName': this.bucketName,
      'bucketFolder': this.bucketFolder,
      'cloudUrl': this.cloudUrl,
      'purchaseCallbackUrl': this.purchaseCallbackUrl,
      'kvkkPrivacyPolicyEn': this.kvkkPrivacyPolicyEn,
      'kvkkPrivacyPolicyTr': this.kvkkPrivacyPolicyTr,
      'onlineSalesAgreementEn': this.onlineSalesAgreementEn,
      'onlineSalesAgreementTr': this.onlineSalesAgreementTr,
      'userConsentConfirmationFormEn': this.userConsentConfirmationFormEn,
      'userConsentConfirmationFormTr': this.userConsentConfirmationFormTr,
      'userAgreementsEn': this.userAgreementsEn,
      'userAgreementsTr': this.userAgreementsTr,

      'personalDataProtectionEn': this.personalDataProtectionEn,
      'personalDataProtectionTr': this.personalDataProtectionTr,

      'basketShippingFee': this.basketShippingFee,
      'basketShippingNoFeeLimit': this.basketShippingNoFeeLimit,

      'basketItemCounterLimit': this.basketItemCounterLimit,

      'kdvTaxPercentage': this.kdvTaxPercentage,
      'forceUpdate': this.forceUpdate,
    };
  }

  factory AppDataEntity.fromMap(Map<String, dynamic> map) {
    return AppDataEntity(
      id: map['id'] as int,
      buildNumber: map['buildNumber'] as String,
      appVersion: map['appVersion'] as String,
      storeUrlEn: map['storeUrlEn'] as String,
      storeUrlTr: map['storeUrlTr'] as String,
      bucketUrl: map['bucketUrl'] as String,
      bucketName: map['bucketName'] as String,
      bucketFolder: map['bucketFolder'] as String,
      cloudUrl: map['cloudUrl'] as String,
      purchaseCallbackUrl: map['purchaseCallbackUrl'] as String,
      kvkkPrivacyPolicyEn: map['kvkkPrivacyPolicyEn'] as String,
      kvkkPrivacyPolicyTr: map['kvkkPrivacyPolicyTr'] as String,
      onlineSalesAgreementEn: map['onlineSalesAgreementEn'] as String,
      onlineSalesAgreementTr: map['onlineSalesAgreementTr'] as String,
      userConsentConfirmationFormEn:
      map['userConsentConfirmationFormEn'] as String,
      userConsentConfirmationFormTr:
      map['userConsentConfirmationFormTr'] as String,
      userAgreementsEn: map['userAgreementsEn'] as String,
      userAgreementsTr: map['userAgreementsTr'] as String,

      personalDataProtectionEn: map['personalDataProtectionEn'] as String,
      personalDataProtectionTr: map['personalDataProtectionTr'] as String,

      basketShippingFee: map['basketShippingFee'] as double,
      basketShippingNoFeeLimit: map['basketShippingNoFeeLimit'] as double,

      basketItemCounterLimit: map['basketItemCounterLimit'] as int,

      kdvTaxPercentage: map['kdvTaxPercentage'] as int,
      forceUpdate: map['forceUpdate'] as bool,
    );
  }

//</editor-fold>
}
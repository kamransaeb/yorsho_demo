abstract class AppService {
  String get locale;
  //bool get isDarkMode;
  bool get isFirstUse;

  String get appVersion;
  String get buildNumber;
  String? get kvkkPrivacyPolicyEn;
  String? get kvkkPrivacyPolicyTr;
  String? get onlineSalesAgreementEn;
  String? get onlineSalesAgreementTr;
  String? get userConsentConfirmationFormEn;
  String? get userConsentConfirmationFormTr;
  String? get userAgreementsEn;
  String? get userAgreementsTr;
  String? get personalDataProtectionEn;
  String? get personalDataProtectionTr;
  String? get storeUrlEn;
  String? get storeUrlTr;
  bool get isAppUpdate;
  String? get purchaseCallbackUrl;

  int? get userBasketAddressDataId;
  int? get userBasketShAddressDataId;

  double? get basketShippingFee;
  double? get basketShippingNoFeeLimit;

  int? get basketItemCounterLimit;



  Future<void> setLocale({required String locale});
  //Future<void> setIsDarkMode({required bool darkMode});
  Future<void> setIsFirstUse({required bool isFirstUse});

  Future<void> setAppVersion({required String appVersion});
  Future<void> setBuildNumber({required String buildNumber});

  Future<void> setKvkkPrivacyPolicyEn({required String? kvkkPrivacyPolicyEn});
  Future<void> setKvkkPrivacyPolicyTr({required String? kvkkPrivacyPolicyTr});

  Future<void> setOnlineSalesAgreementEn({required String? onlineSalesAgreementEn});
  Future<void> setOnlineSalesAgreementTr({required String? onlineSalesAgreementTr});

  Future<void> setUserConsentConfirmationFormEn({required String? userConsentConfirmationFormEn});
  Future<void> setUserConsentConfirmationFormTr({required String? userConsentConfirmationFormTr});

  Future<void> setUserAgreementsEn({required String? userAgreementsEn});
  Future<void> setUserAgreementsTr({required String? userAgreementsTr});

  Future<void> setPersonalDataProtectionEn({required String? personalDataProtectionEn});
  Future<void> setPersonalDataProtectionTr({required String? personalDataProtectionTr});

  Future<void> setStoreUrlEn({required String? storeUrlEn});
  Future<void> setStoreUrlTr({required String? storeUrlTr});

  Future<void> setIsAppUpdate({required bool isAppUpdate});

  Future<void> setPurchaseCallbackUrl({required String? purchaseCallbackUrl});

  Future<void> setUserBasketAddressDataId({required int userBasketAddressDataId});
  Future<void> setUserBasketShAddressDataId({required int userBasketShAddressDataId});

  Future<void> setBasketShippingFee({required double? basketShippingFee});
  Future<void> setBasketShippingNoFeeLimit({required double? basketShippingNoFeeLimit});

  Future<void> setBasketItemCounterLimit({required int? basketItemCounterLimit});
}


import 'package:jiffy/jiffy.dart';
import '../../../core/app_config/app_config.dart';
import '../../../core/constants/app_keys/app_keys.dart';
import '../../../utils/jiffy_locale.dart';
import '../../shared_preferences_storage_service/shared_preferences_storage_service.dart';
import '../app_service.dart';

class AppServiceImpl implements AppService {
  late final SharedPreferencesStorageService _sharedPreferencesStorageService;

  AppServiceImpl({
    required SharedPreferencesStorageService sharedPreferencesStorageService,
  }) : _sharedPreferencesStorageService = sharedPreferencesStorageService;

  @override
  int? get userBasketAddressDataId => _sharedPreferencesStorageService.getInt(
      key: AppKeys.userBasketAddressDataId);

  @override
  int? get userBasketShAddressDataId => _sharedPreferencesStorageService.getInt(
      key: AppKeys.userBasketShAddressDataId);


  @override
  String get locale =>
      _sharedPreferencesStorageService.getString(key: AppKeys.localeKey) ??
      AppConfig.defaultLocale;

  @override
  bool get isFirstUse =>
      _sharedPreferencesStorageService.getBool(key: AppKeys.isFirstUseKey) ??
      true;

  @override
  String? get userAgreementsEn =>
      _sharedPreferencesStorageService.getString(
          key: AppKeys.userAgreementsEnKey) ??
      '';

  @override
  String? get userAgreementsTr =>
      _sharedPreferencesStorageService.getString(
          key: AppKeys.userAgreementsTrKey) ??
      '';

  @override
  String? get userConsentConfirmationFormEn =>
      _sharedPreferencesStorageService.getString(
          key: AppKeys.userConsentConfirmationFormEnKey) ??
      '';

  @override
  String? get userConsentConfirmationFormTr =>
      _sharedPreferencesStorageService.getString(
          key: AppKeys.userConsentConfirmationFormTrKey) ??
      '';

  @override
  String get appVersion =>
      _sharedPreferencesStorageService.getString(key: AppKeys.appVersionKey) ??
      '';

  @override
  String get buildNumber =>
      _sharedPreferencesStorageService.getString(key: AppKeys.buildNumberKey) ??
      '';

  @override
  String? get kvkkPrivacyPolicyEn =>
      _sharedPreferencesStorageService.getString(
          key: AppKeys.kvkkPrivacyPolicyEnKey) ??
      '';

  @override
  String? get kvkkPrivacyPolicyTr =>
      _sharedPreferencesStorageService.getString(
          key: AppKeys.kvkkPrivacyPolicyTrKey) ??
      '';

  @override
  String? get onlineSalesAgreementEn =>
      _sharedPreferencesStorageService.getString(
          key: AppKeys.onlineSalesAgreementEnKey) ??
      '';

  @override
  String? get onlineSalesAgreementTr =>
      _sharedPreferencesStorageService.getString(
          key: AppKeys.onlineSalesAgreementTrKey) ??
      '';

  @override
  String? get personalDataProtectionEn =>
      _sharedPreferencesStorageService.getString(
          key: AppKeys.personalDataProtectionEnKey) ??
      '';

  @override
  String? get personalDataProtectionTr =>
      _sharedPreferencesStorageService.getString(
          key: AppKeys.personalDataProtectionTrKey) ??
      '';

  @override
  String? get storeUrlEn =>
      _sharedPreferencesStorageService.getString(key: AppKeys.storeUrlEnKey) ??
      '';

  @override
  String? get storeUrlTr =>
      _sharedPreferencesStorageService.getString(key: AppKeys.storeUrlTrKey) ??
      '';

  @override
  bool get isAppUpdate =>
      _sharedPreferencesStorageService.getBool(key: AppKeys.isAppUpdateKey) ??
      false;

  @override
  String? get purchaseCallbackUrl =>
      _sharedPreferencesStorageService.getString(
          key: AppKeys.purchaseCallbackUrl) ??
      '';

  @override
  double? get basketShippingFee => _sharedPreferencesStorageService.getDouble(
      key: AppKeys.basketShippingFee);

  @override
  double? get basketShippingNoFeeLimit => _sharedPreferencesStorageService
      .getDouble(key: AppKeys.basketShippingNoFeeLimit);

  @override
  int? get basketItemCounterLimit => _sharedPreferencesStorageService
      .getInt(key: AppKeys.basketItemCounterLimit);

  @override
  Future<void> setBasketItemCounterLimit(
      {required int? basketItemCounterLimit}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.basketItemCounterLimit,
      value: basketItemCounterLimit,
    );
  }

  @override
  Future<void> setBasketShippingNoFeeLimit(
      {required double? basketShippingNoFeeLimit}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.basketShippingNoFeeLimit,
      value: basketShippingNoFeeLimit,
    );
  }

  @override
  Future<void> setBasketShippingFee({required double? basketShippingFee}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.basketShippingFee,
      value: basketShippingFee,
    );
  }

  @override
  Future<void> setUserBasketAddressDataId(
      {required int userBasketAddressDataId}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.userBasketAddressDataId,
      value: userBasketAddressDataId,
    );
  }

  @override
  Future<void> setUserBasketShAddressDataId(
      {required int userBasketShAddressDataId}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.userBasketShAddressDataId,
      value: userBasketShAddressDataId,
    );
  }

  @override
  Future<void> setLocale({required String locale}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.localeKey,
      value: locale,
    );
    await changeJiffyLocale(locale);
  }

  @override
  Future<void> setIsFirstUse({required bool isFirstUse}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.isFirstUseKey,
      value: isFirstUse,
    );
  }

  @override
  Future<void> setAppVersion({required String appVersion}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.appVersionKey,
      value: appVersion,
    );
  }

  @override
  Future<void> setBuildNumber({required String buildNumber}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.buildNumberKey,
      value: buildNumber,
    );
  }

  @override
  Future<void> setKvkkPrivacyPolicyEn(
      {required String? kvkkPrivacyPolicyEn}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.kvkkPrivacyPolicyEnKey,
      value: kvkkPrivacyPolicyEn,
    );
  }

  @override
  Future<void> setKvkkPrivacyPolicyTr(
      {required String? kvkkPrivacyPolicyTr}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.kvkkPrivacyPolicyTrKey,
      value: kvkkPrivacyPolicyTr,
    );
  }

  @override
  Future<void> setOnlineSalesAgreementEn(
      {required String? onlineSalesAgreementEn}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.onlineSalesAgreementEnKey,
      value: onlineSalesAgreementEn,
    );
  }

  @override
  Future<void> setOnlineSalesAgreementTr(
      {required String? onlineSalesAgreementTr}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.onlineSalesAgreementTrKey,
      value: onlineSalesAgreementTr,
    );
  }

  @override
  Future<void> setPersonalDataProtectionEn(
      {required String? personalDataProtectionEn}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.personalDataProtectionEnKey,
      value: personalDataProtectionEn,
    );
  }

  @override
  Future<void> setPersonalDataProtectionTr(
      {required String? personalDataProtectionTr}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.personalDataProtectionTrKey,
      value: personalDataProtectionTr,
    );
  }

  @override
  Future<void> setUserAgreementsEn({required String? userAgreementsEn}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.userAgreementsEnKey,
      value: userAgreementsEn,
    );
  }

  @override
  Future<void> setUserAgreementsTr({required String? userAgreementsTr}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.userAgreementsTrKey,
      value: userAgreementsTr,
    );
  }

  @override
  Future<void> setUserConsentConfirmationFormEn(
      {required String? userConsentConfirmationFormEn}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.userConsentConfirmationFormEnKey,
      value: userConsentConfirmationFormEn,
    );
  }

  @override
  Future<void> setUserConsentConfirmationFormTr(
      {required String? userConsentConfirmationFormTr}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.userConsentConfirmationFormTrKey,
      value: userConsentConfirmationFormTr,
    );
  }

  @override
  Future<void> setStoreUrlEn({required String? storeUrlEn}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.storeUrlEnKey,
      value: storeUrlEn,
    );
  }

  @override
  Future<void> setStoreUrlTr({required String? storeUrlTr}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.storeUrlTrKey,
      value: storeUrlTr,
    );
  }

  @override
  Future<void> setIsAppUpdate({required bool isAppUpdate}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.isAppUpdateKey,
      value: isAppUpdate,
    );
  }

  @override
  Future<void> setPurchaseCallbackUrl(
      {required String? purchaseCallbackUrl}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.purchaseCallbackUrl,
      value: purchaseCallbackUrl,
    );
  }
}

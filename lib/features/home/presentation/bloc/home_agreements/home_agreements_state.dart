part of 'home_agreements_bloc.dart';

enum HomeAgreementsStatus { initial, loading, success, failure }

enum HomeAgreementsCompleteStatus { initial, loading, success, failure }


class HomeAgreementsState extends Equatable {

  final HomeAgreementsStatus homeAgreementsStatus;
  final HomeAgreementsCompleteStatus homeAgreementsCompleteStatus;
  final UserYorshoEntity userYorshoEntity;
  final Failure failure;
  final bool isValid;
  final bool isKvkkPrivacyPolicyAgreed;
  final bool isUserConsentConfirmationFormAgreed;
  final String kvkkPrivacyPolicyEn;
  final String userConsentConfirmationFormEn;
  final String kvkkPrivacyPolicyTr;
  final String userConsentConfirmationFormTr;

  @override
  List<Object?> get props => [homeAgreementsStatus, homeAgreementsCompleteStatus, userYorshoEntity, failure,
    isValid, isKvkkPrivacyPolicyAgreed, isUserConsentConfirmationFormAgreed,
    kvkkPrivacyPolicyEn, userConsentConfirmationFormEn,
    kvkkPrivacyPolicyTr, userConsentConfirmationFormTr,
  ];

//<editor-fold desc="Data Methods">
  const HomeAgreementsState({
    this.homeAgreementsStatus = HomeAgreementsStatus.initial,
    this.homeAgreementsCompleteStatus = HomeAgreementsCompleteStatus.initial,
    required this.userYorshoEntity,
    this.failure = const Failure(),
    this.isValid = false,
    this.isKvkkPrivacyPolicyAgreed = false,
    this.isUserConsentConfirmationFormAgreed = false,
    this.kvkkPrivacyPolicyEn = '',
    this.userConsentConfirmationFormEn = '',
    this.kvkkPrivacyPolicyTr = '',
    this.userConsentConfirmationFormTr = '',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeAgreementsState &&
          runtimeType == other.runtimeType &&
          homeAgreementsStatus == other.homeAgreementsStatus &&
          homeAgreementsCompleteStatus == other.homeAgreementsCompleteStatus &&
          userYorshoEntity == other.userYorshoEntity &&
          failure == other.failure &&
          isValid == other.isValid &&
          isKvkkPrivacyPolicyAgreed == other.isKvkkPrivacyPolicyAgreed &&
          isUserConsentConfirmationFormAgreed ==
              other.isUserConsentConfirmationFormAgreed &&
          kvkkPrivacyPolicyEn == other.kvkkPrivacyPolicyEn &&
          userConsentConfirmationFormEn ==
              other.userConsentConfirmationFormEn &&
          kvkkPrivacyPolicyTr == other.kvkkPrivacyPolicyTr &&
          userConsentConfirmationFormTr == other.userConsentConfirmationFormTr);

  @override
  int get hashCode =>
      homeAgreementsStatus.hashCode ^
      homeAgreementsCompleteStatus.hashCode ^
      userYorshoEntity.hashCode ^
      failure.hashCode ^
      isValid.hashCode ^
      isKvkkPrivacyPolicyAgreed.hashCode ^
      isUserConsentConfirmationFormAgreed.hashCode ^
      kvkkPrivacyPolicyEn.hashCode ^
      userConsentConfirmationFormEn.hashCode ^
      kvkkPrivacyPolicyTr.hashCode ^
      userConsentConfirmationFormTr.hashCode;

  @override
  String toString() {
    return 'HomeAgreementsState{' +
        ' homeAgreementsStatus: $homeAgreementsStatus,' +
        ' homeAgreementsCompleteStatus: $homeAgreementsCompleteStatus,' +
        ' userYorshoEntity: $userYorshoEntity,' +
        ' failure: $failure,' +
        ' isValid: $isValid,' +
        ' isKvkkPrivacyPolicyAgreed: $isKvkkPrivacyPolicyAgreed,' +
        ' isUserConsentConfirmationFormAgreed: $isUserConsentConfirmationFormAgreed,' +
        ' kvkkPrivacyPolicyEn: $kvkkPrivacyPolicyEn,' +
        ' userConsentConfirmationFormEn: $userConsentConfirmationFormEn,' +
        ' kvkkPrivacyPolicyTr: $kvkkPrivacyPolicyTr,' +
        ' userConsentConfirmationFormTr: $userConsentConfirmationFormTr,' +
        '}';
  }

  HomeAgreementsState copyWith({
    HomeAgreementsStatus? homeAgreementsStatus,
    HomeAgreementsCompleteStatus? homeAgreementsCompleteStatus,
    UserYorshoEntity? userYorshoEntity,
    Failure? failure,
    bool? isValid,
    bool? isKvkkPrivacyPolicyAgreed,
    bool? isUserConsentConfirmationFormAgreed,
    String? kvkkPrivacyPolicyEn,
    String? userConsentConfirmationFormEn,
    String? kvkkPrivacyPolicyTr,
    String? userConsentConfirmationFormTr,
  }) {
    return HomeAgreementsState(
      homeAgreementsStatus: homeAgreementsStatus ?? this.homeAgreementsStatus,
      homeAgreementsCompleteStatus: homeAgreementsCompleteStatus ?? this.homeAgreementsCompleteStatus,
      userYorshoEntity: userYorshoEntity ?? this.userYorshoEntity,
      failure: failure ?? this.failure,
      isValid: isValid ?? this.isValid,
      isKvkkPrivacyPolicyAgreed:
          isKvkkPrivacyPolicyAgreed ?? this.isKvkkPrivacyPolicyAgreed,
      isUserConsentConfirmationFormAgreed:
          isUserConsentConfirmationFormAgreed ??
              this.isUserConsentConfirmationFormAgreed,
      kvkkPrivacyPolicyEn: kvkkPrivacyPolicyEn ?? this.kvkkPrivacyPolicyEn,
      userConsentConfirmationFormEn:
          userConsentConfirmationFormEn ?? this.userConsentConfirmationFormEn,
      kvkkPrivacyPolicyTr: kvkkPrivacyPolicyTr ?? this.kvkkPrivacyPolicyTr,
      userConsentConfirmationFormTr:
          userConsentConfirmationFormTr ?? this.userConsentConfirmationFormTr,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'homeAgreementsStatus': this.homeAgreementsStatus,
      'homeAgreementsCompleteStatus': this.homeAgreementsCompleteStatus,
      'userYorshoEntity': this.userYorshoEntity,
      'failure': this.failure,
      'isValid': this.isValid,
      'isKvkkPrivacyPolicyAgreed': this.isKvkkPrivacyPolicyAgreed,
      'isUserConsentConfirmationFormAgreed':
          this.isUserConsentConfirmationFormAgreed,
      'kvkkPrivacyPolicyEn': this.kvkkPrivacyPolicyEn,
      'userConsentConfirmationFormEn': this.userConsentConfirmationFormEn,
      'kvkkPrivacyPolicyTr': this.kvkkPrivacyPolicyTr,
      'userConsentConfirmationFormTr': this.userConsentConfirmationFormTr,
    };
  }

  factory HomeAgreementsState.fromMap(Map<String, dynamic> map) {
    return HomeAgreementsState(
      homeAgreementsStatus: map['homeAgreementsStatus'] as HomeAgreementsStatus,
      homeAgreementsCompleteStatus: map['homeAgreementsCompleteStatus'] as HomeAgreementsCompleteStatus,
      userYorshoEntity: map['userYorshoEntity'] as UserYorshoEntity,
      failure: map['failure'] as Failure,
      isValid: map['isValid'] as bool,
      isKvkkPrivacyPolicyAgreed: map['isKvkkPrivacyPolicyAgreed'] as bool,
      isUserConsentConfirmationFormAgreed:
          map['isUserConsentConfirmationFormAgreed'] as bool,
      kvkkPrivacyPolicyEn: map['kvkkPrivacyPolicyEn'] as String,
      userConsentConfirmationFormEn:
          map['userConsentConfirmationFormEn'] as String,
      kvkkPrivacyPolicyTr: map['kvkkPrivacyPolicyTr'] as String,
      userConsentConfirmationFormTr:
          map['userConsentConfirmationFormTr'] as String,
    );
  }

//</editor-fold>
}

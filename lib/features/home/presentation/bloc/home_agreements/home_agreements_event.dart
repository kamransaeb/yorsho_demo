part of 'home_agreements_bloc.dart';

abstract class HomeAgreementsEvent extends Equatable {
  const HomeAgreementsEvent();

  @override
  List<Object?> get props => [];
}

final class HomeAgreementsEventFetched extends HomeAgreementsEvent {
  final UserYorshoEntity userYorshoEntity;
  const HomeAgreementsEventFetched({required this.userYorshoEntity});
}

final class HomeAgreementsEventKvkkPrivacyPolicyAgreed extends HomeAgreementsEvent {
  final bool isKvkkPrivacyPolicyAgreed;
  const HomeAgreementsEventKvkkPrivacyPolicyAgreed({required this.isKvkkPrivacyPolicyAgreed});
}

final class HomeAgreementsEventUserConsentConfirmationFormAgreed extends HomeAgreementsEvent {
  final bool isUserConsentConfirmationFormAgreed;
  const HomeAgreementsEventUserConsentConfirmationFormAgreed({required this.isUserConsentConfirmationFormAgreed});
}

final class HomeAgreementsEventAgreementsCompleted extends HomeAgreementsEvent {
  const HomeAgreementsEventAgreementsCompleted();
}
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/exceptions/exceptions.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../services/app_service/app_service.dart';
import '../../../../../services/cache_client_service/cache_client_service.dart';
import '../../../use_cases/complete_user_yorsho_use_case.dart';
import '../../../use_cases/complete_user_yorsho_use_case_params.dart';

part 'home_agreements_event.dart';

part 'home_agreements_state.dart';

class HomeAgreementsBloc
    extends Bloc<HomeAgreementsEvent, HomeAgreementsState> {
  final AppService _appService;
  final CompleteUserYorshoUseCase _completeUserYorshoUseCase;
  final CacheClientService _cacheClientService;

  HomeAgreementsBloc({
    required AppService appService,
    required CompleteUserYorshoUseCase completeUserYorshoUseCase,
    required CacheClientService cacheClientService,
  })  : _appService = appService,
        _completeUserYorshoUseCase = completeUserYorshoUseCase,
        _cacheClientService = cacheClientService,
        super(
          const HomeAgreementsState(
            userYorshoEntity: UserYorshoEntity.empty,
          ),
        ) {
    on<HomeAgreementsEventFetched>(_onHomeAgreementsEventFetched);
    on<HomeAgreementsEventKvkkPrivacyPolicyAgreed>(
        _onHomeAgreementsEventKvkkPrivacyPolicyAgreed);
    on<HomeAgreementsEventUserConsentConfirmationFormAgreed>(
        _onHomeAgreementsEventUserConsentConfirmationFormAgreed);
    on<HomeAgreementsEventAgreementsCompleted>(
        _onHomeAgreementsEventAgreementsCompleted);
  }

  _onHomeAgreementsEventKvkkPrivacyPolicyAgreed(
      HomeAgreementsEventKvkkPrivacyPolicyAgreed event,
      Emitter<HomeAgreementsState> emit) async {
    emit(
      state.copyWith(
        isKvkkPrivacyPolicyAgreed: event.isKvkkPrivacyPolicyAgreed,
        isUserConsentConfirmationFormAgreed:
            state.isUserConsentConfirmationFormAgreed,
        isValid: event.isKvkkPrivacyPolicyAgreed &&
            state.isUserConsentConfirmationFormAgreed,
      ),
    );
  }

  _onHomeAgreementsEventUserConsentConfirmationFormAgreed(
      HomeAgreementsEventUserConsentConfirmationFormAgreed event,
      Emitter<HomeAgreementsState> emit) async {
    emit(
      state.copyWith(
        isUserConsentConfirmationFormAgreed:
            event.isUserConsentConfirmationFormAgreed,
        isKvkkPrivacyPolicyAgreed: state.isKvkkPrivacyPolicyAgreed,
        isValid: event.isUserConsentConfirmationFormAgreed &&
            state.isKvkkPrivacyPolicyAgreed,
      ),
    );
  }

  _onHomeAgreementsEventAgreementsCompleted(
      HomeAgreementsEventAgreementsCompleted event,
      Emitter<HomeAgreementsState> emit) async {
    if (!state.isValid) return;

    emit(
      state.copyWith(
        homeAgreementsStatus: HomeAgreementsStatus.loading,
      ),
    );

    Either<Failure, UserYorshoEntity> result =
        await _completeUserYorshoUseCase(
      CompleteUserYorshoUseCaseParams(
          userYorshoEntity: state.userYorshoEntity),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            homeAgreementsStatus: HomeAgreementsStatus.success,
            homeAgreementsCompleteStatus: HomeAgreementsCompleteStatus.failure,
            failure: Failure(
              message: failure.message,
              status: failure.status,
            ),
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            homeAgreementsStatus: HomeAgreementsStatus.success,
            homeAgreementsCompleteStatus: HomeAgreementsCompleteStatus.success,
            userYorshoEntity: data,
            failure: const Failure(),
          ),
        );
      },
    );
  }

  _onHomeAgreementsEventFetched(HomeAgreementsEventFetched event,
      Emitter<HomeAgreementsState> emit) async {
    emit(
      state.copyWith(
        userYorshoEntity: event.userYorshoEntity,
        homeAgreementsStatus: HomeAgreementsStatus.success,
        kvkkPrivacyPolicyEn: _appService.kvkkPrivacyPolicyEn,
        kvkkPrivacyPolicyTr: _appService.kvkkPrivacyPolicyTr,
        userConsentConfirmationFormEn:
            _appService.userConsentConfirmationFormEn,
        userConsentConfirmationFormTr:
            _appService.userConsentConfirmationFormTr,
      ),
    );
  }
}

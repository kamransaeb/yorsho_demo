import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../core/app_config/app_config.dart';
import '../../../../core/failure/failure.dart';
import '../../../../data/authentication/models/my_user.dart';
import '../../../../data/authentication/repositories/authentication_repository.dart';
import '../../../../entities/app_data/app_data_entity.dart';
import '../../../../services/app_service/app_service.dart';
import '../../../../services/cache_client_service/cache_client_service.dart';
import '../../../../services/log_service/log_service.dart';
import '../../../../utils/jiffy_locale.dart';
import '../../use_cases/get_app_data_params.dart';
import '../../use_cases/get_app_data_use_case.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppService _appService;
  final LogService _logService;
  final CacheClientService _cacheClientService;
  final GetAppDataUseCase _getAppDataUseCase;
  final AuthenticationRepository _authenticationRepository;

  late final StreamSubscription<MyUser?> _userSubscription;

  AppBloc({
    required AppService appService,
    required LogService logService,
    required CacheClientService cacheClientService,
    required GetAppDataUseCase getAppDataUseCase,
    required AuthenticationRepository authenticationRepository,
  })  : _logService = logService,
        _appService = appService,
        _getAppDataUseCase = getAppDataUseCase,
        _cacheClientService = cacheClientService,
        _authenticationRepository = authenticationRepository,
        super(authenticationRepository.cachedMyUser.isNotEmpty
          ? AppState.authenticated(authenticationRepository.cachedMyUser)
          : const AppState.unauthenticated()) {

    _userSubscription = _authenticationRepository.myUser.listen((user) {
      if (user != null) {
        add(_AppEventUserChanged(user));
        _logService.i(
            'AppBloc _userSubscription listener is called');
      }
    });

    on<AppEventLoaded>(_onAppEventLoaded);
    on<AppEventFirstUseDisabled>(_onFirstUseDisabled);
    on<AppEventLocaleChanged>(_onLocaleChanged);
    on<_AppEventUserChanged>(_onAppEventUserChanged);
    on<AppEventLogOutRequested>(_onLogOutRequested);
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  _onAppEventLoaded(AppEventLoaded event, Emitter<AppState> emit) async {
    try {
      emit(state.copyWith(appStatus: AppStatus.loading));
      final bool isFirstUse = _appService.isFirstUse;

      final String locale = _appService.locale;
      await changeJiffyLocale(locale);

      int appDataId = Platform.isIOS ? 1 : 2;

      Either<Failure, AppDataEntity> result =
      await _getAppDataUseCase(GetAppDataParams(appDataId: appDataId));
      await result.fold(
            (failure) {
          emit(
            state.copyWith(
              locale: locale,
              isFirstUse: isFirstUse,
              appStatus: AppStatus.failure,
              failure: Failure(
                message: failure.message,
                status: failure.status,
              ),
            ),
          );
        },
            (data) async {
          await Future.wait([
            _appService.setAppVersion(appVersion: data.appVersion),
            _appService.setBuildNumber(buildNumber: data.buildNumber),
            _appService.setKvkkPrivacyPolicyEn(
                kvkkPrivacyPolicyEn: data.kvkkPrivacyPolicyEn),
            _appService.setKvkkPrivacyPolicyTr(
                kvkkPrivacyPolicyTr: data.kvkkPrivacyPolicyTr),
            _appService.setOnlineSalesAgreementEn(
                onlineSalesAgreementEn: data.onlineSalesAgreementEn),
            _appService.setOnlineSalesAgreementTr(
                onlineSalesAgreementTr: data.onlineSalesAgreementTr),
            _appService.setPersonalDataProtectionEn(
                personalDataProtectionEn: data.personalDataProtectionEn),
            _appService.setPersonalDataProtectionTr(
                personalDataProtectionTr: data.personalDataProtectionTr),
            _appService.setUserAgreementsEn(
                userAgreementsEn: data.userAgreementsEn),
            _appService.setUserAgreementsTr(
                userAgreementsTr: data.userAgreementsTr),
            _appService.setUserConsentConfirmationFormEn(
                userConsentConfirmationFormEn:
                data.userConsentConfirmationFormEn),
            _appService.setUserConsentConfirmationFormTr(
                userConsentConfirmationFormTr:
                data.userConsentConfirmationFormTr),

            _appService.setStoreUrlEn(storeUrlEn: data.storeUrlEn),
            _appService.setStoreUrlTr(storeUrlTr: data.storeUrlTr),

            _appService.setPurchaseCallbackUrl(purchaseCallbackUrl: data.purchaseCallbackUrl),

            _appService.setBasketShippingFee(basketShippingFee: data.basketShippingFee),
            _appService.setBasketShippingNoFeeLimit(basketShippingNoFeeLimit: data.basketShippingNoFeeLimit),
            _appService.setPurchaseCallbackUrl(purchaseCallbackUrl: data.purchaseCallbackUrl),
          ]).then(
                (value) async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();
              String appName = packageInfo.appName;
              String packageName = packageInfo.packageName;
              String appVersion = packageInfo.version;
              String buildNumber = packageInfo.buildNumber;
              String appVersionFromMobile = appVersion + buildNumber;

              String appVersionFromRest = data.appVersion + data.buildNumber;
              if (appVersionFromRest.compareTo(appVersionFromMobile) != 0 &&
                  data.forceUpdate != null &&
                  data.forceUpdate!) {
                await _appService.setIsAppUpdate(isAppUpdate: false);
              } else {
                await _appService.setIsAppUpdate(isAppUpdate: true);
              }
              emit(
                state.copyWith(
                  appStatus: AppStatus.success,
                  failure: const Failure(),
                  locale: locale,
                  isFirstUse: isFirstUse,
                  basketItemCounterLimit: data.basketItemCounterLimit,
                  basketShippingFee: data.basketShippingFee,
                  basketShippingNoFeeLimit: data.basketShippingNoFeeLimit,
                ),
              );
            },
          ).catchError((error, stackTrace) {
            _logService.e('AppBloc load failed', error, stackTrace);
            emit(
              state.copyWith(
                appStatus: AppStatus.failure,
                failure: const Failure(
                    status: FailureStatus.none,
                    message: 'failure_app_data_load'),
              ),
            );
          });
        },
      );
    } catch (error, stackTrace) {
      _logService.e('AppBloc load failed', error, stackTrace);
      emit(
        state.copyWith(
          appStatus: AppStatus.failure,
          failure:
          Failure(status: FailureStatus.none, message: error.toString()),
        ),
      );
    }
  }

  _onFirstUseDisabled(
      AppEventFirstUseDisabled event, Emitter<AppState> emit) async {
    if (state.isFirstUse) {
      await _appService.setIsFirstUse(isFirstUse: false);
      emit(
        state.copyWith(isFirstUse: false),
      );
    }
  }

  _onLocaleChanged(AppEventLocaleChanged event, Emitter<AppState> emit) async {
    if (state.locale != event.locale) {
      await _appService.setLocale(locale: event.locale);
      emit(
        state.copyWith(
          locale: event.locale,
        ),
      );
    }
  }

  _onAppEventUserChanged(_AppEventUserChanged event, Emitter<AppState> emit) {
    if (event.myUser.isNotEmpty) {
      _logService.i('_onUserChanged AppState.authenticated');
    } else {
      _logService.i('_onUserChanged AppState.unauthenticated');
    }

    emit(
      event.myUser.isNotEmpty
          ? state.copyWith(
          authenticationStatus: AuthenticationStatus.authenticated,
          myUser: event.myUser)
          : state.copyWith(
          authenticationStatus: AuthenticationStatus.unauthenticated),
    );
  }

  _onLogOutRequested(AppEventLogOutRequested event, Emitter<AppState> emit) {
    emit(state.copyWith(appStatus: AppStatus.loading));
    try {
      _authenticationRepository.logOut();
    } catch (error, stackTrace) {
      _logService.e('AppBloc _onLogOutRequested() failed', error, stackTrace);
    }
    emit(state.copyWith(appStatus: AppStatus.success));
  }
}
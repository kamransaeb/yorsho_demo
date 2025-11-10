import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/constants/cache_client_keys/cache_client_keys.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/failure/failure.dart';
import '../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../services/cache_client_service/cache_client_service.dart';
import '../../../../services/log_service/log_service.dart';
import '../../data_sources/user_yorsho_remote_data_source.dart';
import '../user_basket_repository.dart';

class UserYorshoRepositoryImpl implements UserYorshoRepository {
  final UserYorshoRemoteDataSource _userYorshoRemoteDataSource;
  final LogService _logService;
  final CacheClientService _cacheClientService;

  const UserYorshoRepositoryImpl({required UserYorshoRemoteDataSource userYorshoRemoteDataSource,
    required CacheClientService cacheClientService,
    required  LogService logService}) :
        _userYorshoRemoteDataSource =  userYorshoRemoteDataSource,
        _cacheClientService = cacheClientService,
        _logService = logService;

  @override
  Future<Either<Failure, UserYorshoEntity>> getOrCreateUserYorshoOpenMobile(
      String firebaseToken) async {
    try {
      final response = await _userYorshoRemoteDataSource.getOrCreateUserYorshoOpenMobile(firebaseToken);
      UserYorshoEntity userYorshoEntityResponse = response.toEntity();
      _cacheClientService.write<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey, value: userYorshoEntityResponse);
      return Right(userYorshoEntityResponse);
    } on RestApiException {
      _cacheClientService.write<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey, value: UserYorshoEntity.empty);
      return const Left(
        Failure(
            message: 'server_error_please_try_again',
            status: FailureStatus.serverFailure),
      );
    } on SocketException {
      _cacheClientService.write<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey, value: UserYorshoEntity.empty);
      return const Left(
        Failure(
          message: 'internet_connection_failure',
          status: FailureStatus.connectionFailure,
        ),
      );
    } catch (e) {
      _cacheClientService.write<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey, value: UserYorshoEntity.empty);
      return const Left(
        Failure(
            message: 'server_error_please_try_again',
            status: FailureStatus.serverFailure),
      );
    }
  }

  @override
  Future<Either<Failure, UserYorshoEntity>> completeUserYorshoMobileClient(String firebaseToken, UserYorshoEntity userYorshoEntity) async {

    try {
      final response = await _userYorshoRemoteDataSource.completeUserYorshoMobileClient(firebaseToken, userYorshoEntity.toModel());
      UserYorshoEntity userYorshoEntityResponse = response.toEntity();
      _cacheClientService.write<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey, value: userYorshoEntityResponse);
      return Right(userYorshoEntityResponse);
    } on RestApiException {
      return const Left(
        Failure(
            message: 'server_error_please_try_again',
            status: FailureStatus.serverFailure),
      );
    } on SocketException {
      return const Left(
        Failure(
          message: 'internet_connection_failure',
          status: FailureStatus.connectionFailure,
        ),
      );
    } catch (e) {
      return const Left(
        Failure(
            message: 'server_error_please_try_again',
            status: FailureStatus.serverFailure),
      );
    }
  }
  
  @override
  Future<Either<Failure, UserYorshoEntity>> updateUserYorshoMobileClient(String firebaseToken, UserYorshoEntity userYorshoEntity) async {

    try {
      final response = await _userYorshoRemoteDataSource.updateUserYorshoMobileClient(firebaseToken, userYorshoEntity.toModel());
      UserYorshoEntity userYorshoEntityResponse = response.toEntity();
      _cacheClientService.write<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey, value: userYorshoEntityResponse);
      return Right(userYorshoEntityResponse);
    } on RestApiException {
      return const Left(
        Failure(
            message: 'server_error_please_try_again',
            status: FailureStatus.serverFailure),
      );
    } on SocketException {
      return const Left(
        Failure(
          message: 'internet_connection_failure',
          status: FailureStatus.connectionFailure,
        ),
      );
    } catch (e) {
      return const Left(
        Failure(
            message: 'server_error_please_try_again',
            status: FailureStatus.serverFailure),
      );
    }
  }

  @override
  Future<Either<Failure, UserYorshoEntity>> getUserYorshoMobileClient(
      String firebaseToken) async {
    try {
      final response = await _userYorshoRemoteDataSource.getUserYorshoMobileClient(firebaseToken);
      UserYorshoEntity userYorshoEntityResponse = response.toEntity();
      _cacheClientService.write<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey, value: userYorshoEntityResponse);
      return Right(userYorshoEntityResponse);
    } on RestApiException {
      _cacheClientService.write<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey, value: UserYorshoEntity.empty);
      return const Left(
        Failure(
            message: 'server_error_please_try_again',
            status: FailureStatus.serverFailure),
      );
    } on SocketException {
      _cacheClientService.write<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey, value: UserYorshoEntity.empty);
      return const Left(
        Failure(
          message: 'internet_connection_failure',
          status: FailureStatus.connectionFailure,
        ),
      );
    } catch (e) {
      _cacheClientService.write<UserYorshoEntity>(key: CacheClientKeys.userYorshoEntityCacheKey, value: UserYorshoEntity.empty);
      return const Left(
        Failure(
            message: 'server_error_please_try_again',
            status: FailureStatus.serverFailure),
      );
    }
  }
  
  

}

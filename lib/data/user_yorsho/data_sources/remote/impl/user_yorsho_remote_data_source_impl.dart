import 'dart:io';

import 'package:dio/dio.dart';
import '../../../../../core/constants/rest_api/rest_api.dart';
import '../../../../../core/constants/urls/urls.dart';
import '../../../../../core/exceptions/exceptions.dart';
import '../../../models/user_yorsho_model.dart';
import '../../user_yorsho_remote_data_source.dart';

class UserYorshoRemoteDataSourceImpl implements UserYorshoRemoteDataSource {
  final Dio _dio;

  const UserYorshoRemoteDataSourceImpl({
  required Dio dio   
}) : _dio = dio;

  @override
  Future<UserYorshoModel> getOrCreateUserYorshoOpenMobile(String firebaseToken) async {
    try {
      final response = await _dio.get(
        Urls.getOrCreateUserYorshoOpenMobile(),
        options: Options(
          headers: {
            RestApi.firebaseAuthorizationHeaderName: firebaseToken,
          },
        ),
      );

      if (response.statusCode == RestApi.responseSuccessful) {
        var jsonDecoded = response.data;
        UserYorshoModel userYorshoModelResponse = UserYorshoModel.fromJson(jsonDecoded);
        return userYorshoModelResponse;
      } else {
        throw RestApiException(statusCode: response.statusCode);
      }
    } on DioException catch(e) {

      if (e.type == DioExceptionType.connectionError || e.type == DioExceptionType.connectionTimeout) {
        throw const SocketException('Connection to network failed!');
      } else if (e.response != null) {
        throw RestApiException(statusCode: e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<UserYorshoModel> updateUserYorshoMobileClient(String firebaseToken, UserYorshoModel userYorshoModel) async {
    try {
      final response = await _dio.put(
        Urls.updateUserYorshoMobileClient(),
        options: Options(
          headers: {
            RestApi.firebaseAuthorizationHeaderName: firebaseToken,
          },
        ),
        data: userYorshoModel.toJson(),
      );

      if (response.statusCode == RestApi.responseSuccessful) {
        var jsonDecoded = response.data;
        return UserYorshoModel.fromJson(jsonDecoded);
      } else {
        throw RestApiException(statusCode: response.statusCode);
      }
    } on DioException catch(e) {
      if (e.type == DioExceptionType.connectionError || e.type == DioExceptionType.connectionTimeout) {
        throw const SocketException('Connection to network failed!');
      } else if (e.response != null) {
        throw RestApiException(statusCode: e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<UserYorshoModel> completeUserYorshoMobileClient(String firebaseToken, UserYorshoModel userYorshoModel) async {
    try {


      final response = await _dio.put(
        Urls.completeUserYorshoMobileClient(),
        options: Options(
          headers: {
            RestApi.firebaseAuthorizationHeaderName: firebaseToken,
          },
        ),
        data: userYorshoModel.toJson(),
      );

      if (response.statusCode == RestApi.responseSuccessful) {
        var jsonDecoded = response.data;
        return UserYorshoModel.fromJson(jsonDecoded);
      } else {
        throw RestApiException(statusCode: response.statusCode);
      }
    } on DioException catch(e) {
      if (e.type == DioExceptionType.connectionError || e.type == DioExceptionType.connectionTimeout) {
        throw const SocketException('Connection to network failed!');
      } else if (e.response != null) {
        throw RestApiException(statusCode: e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<UserYorshoModel> getUserYorshoMobileClient(String firebaseToken) async {
    try {
      final response = await _dio.get(
        Urls.getUserYorshoMobileClient(),
        options: Options(
          headers: {
            RestApi.firebaseAuthorizationHeaderName: firebaseToken,
          },
        ),
      );

      if (response.statusCode == RestApi.responseSuccessful) {
        var jsonDecoded = response.data;
        UserYorshoModel userYorshoModelResponse = UserYorshoModel.fromJson(jsonDecoded);
        return userYorshoModelResponse;
      } else {
        throw RestApiException(statusCode: response.statusCode);
      }
    } on DioException catch(e) {

      if (e.type == DioExceptionType.connectionError || e.type == DioExceptionType.connectionTimeout) {
        throw const SocketException('Connection to network failed!');
      } else if (e.response != null) {
        throw RestApiException(statusCode: e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }


}
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../core/constants/rest_api/rest_api.dart';
import '../../../../../core/constants/urls/urls.dart';
import '../../../../../core/exceptions/exceptions.dart';
import '../../../models/videos_category_model.dart';
import '../videos_category_remote_data_source.dart';

class VideosCategoryRemoteDataSourceImpl implements VideosCategoryRemoteDataSource {
  final Dio _dio;

  const VideosCategoryRemoteDataSourceImpl( {required Dio dio}
      ) : _dio = dio;

  @override
  Future<List<VideosCategoryModel>> getVideosCategoryListEnabledMobileClient(String firebaseToken,) async {
    try {
      final response = await _dio.get(
        Urls.getVideosCategoryListEnabledMobileClient(),
        options: Options(
          headers: {
            RestApi.firebaseAuthorizationHeaderName: firebaseToken,
          },
        ),
        //options: Headers()..add("name", "value")..add("name", "value"),
      );
      if (response.statusCode == 200) {
        List<VideosCategoryModel> videosCategoryList = [];

        var jsonDecoded = response.data;

        for (var yogaStyle in jsonDecoded) {
          videosCategoryList.add(VideosCategoryModel.fromJson(yogaStyle));
        }
        return videosCategoryList;
      } else {
        throw RestApiException(statusCode: response.statusCode);
      }
    } on DioException catch (e) {
      if ((e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout)
      //    && e.error is SocketException
      ) {
        // handle no connection error
        throw const SocketException('Connection to network failed!');
      } else if (e.response != null) {
        throw RestApiException(statusCode: e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }


}

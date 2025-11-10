import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../core/constants/rest_api/rest_api.dart';
import '../../../../../core/constants/urls/urls.dart';
import '../../../../../core/exceptions/exceptions.dart';
import '../../../models/videos_model.dart';
import '../videos_remote_data_source.dart';

class VideosRemoteDataSourceImpl implements VideosRemoteDataSource {
  final Dio _dio;

  const VideosRemoteDataSourceImpl( {required Dio dio}
      ) : _dio = dio;

  @override
  Future<List<VideosModel>> getVideosListEnabledByVideosCategoryIdListMobileClient(String firebaseToken, List<int> videosCategoryIdList) async {
    try {
      final response = await _dio.get(
        Urls.getVideosListEnabledByVideosCategoryIdListMobileClient(),
        queryParameters: {
          "videosCategoryIdList": videosCategoryIdList,
        },
        options: Options(
          headers: {
            RestApi.firebaseAuthorizationHeaderName: firebaseToken,
          },
        ),

      );
      if (response.statusCode == 200) {
        List<VideosModel> videosList = [];

        var jsonDecoded = response.data;

        for (var videos in jsonDecoded) {
          videosList.add(VideosModel.fromJson(videos));
        }
        return videosList;
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

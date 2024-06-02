import 'package:dio/dio.dart';
import 'package:laza_app/core/api/api_consumer.dart';
import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/core/errors/error_model.dart';
import 'package:laza_app/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true));
  }

  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParams,
        String? token,
      bool isFormData = false}) async {
    try {
      final response = await dio.delete(path,
          options: Options(headers: {"Authorization":"Bearer $token"}),
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParams}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParams,
        String? token,
      bool isFormData = false}) async {
    try {
      final response = await dio.post(path,
          options: Options(headers: {"Authorization":"Bearer $token"}),
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParams,
      bool isFormData = false}) async {
    try {
      final response = await dio.patch(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}

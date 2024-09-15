import 'package:dio/dio.dart';

import 'dio_interceptors.dart';
import '../end_points.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        followRedirects: false,
        receiveDataWhenStatusError: true,
        validateStatus: (status) => status! < 500,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );

    /// DIO [HEADERS]
    dio!.options.headers = {'Content-Type': 'application/json'};

    /// DIO [INTERCEPTORS]
    dio!.interceptors.addAll({
      AppInterceptors(dio!),
      LogInterceptor(requestBody: true, responseBody: true)
    });
  }

  /// METHOD [POST] DATA FROM API
  static Future<Response> post({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    data,
  }) async {
    dio!.options.headers = headers ?? {'Content-Type': 'application/json'};
    return await dio!.post(url, data: data, queryParameters: query);
  }

  /// METHOD [GET] DATA FROM API
  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }

  /// METHOD [DELETE] DATA FROM API
  static Future<Response> delete({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.delete(url, queryParameters: query);
  }

  /// METHOD [PATCH] UPDATE DATA ON API
  static Future<Response> patch({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    return await dio!.patch(url, data: data, queryParameters: query);
  }
}

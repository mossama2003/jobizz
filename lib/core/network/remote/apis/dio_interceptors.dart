import 'package:dio/dio.dart';

import '../../local/cache/cache_helper.dart';

/// AN INTERCEPTORS THAT HANDLES THE ERROR RESPONSES FROM A [DIO] REQUEST.
class AppInterceptors extends Interceptor {
  AppInterceptors(this.dio);

  /// THE [Dio] INSTANCE USED TO HANDLE ALL REQUEST.
  final Dio dio;

  /// ON [REQUEST] API
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['lang'] = await CacheHelper.get('lang');
    return handler.next(options);
  }

  /// ON [RESPONSE] API
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }
}

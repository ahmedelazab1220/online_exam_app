import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

abstract class DioProvider {
  Dio provideDio() {
    final dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      baseUrl: ApiConstants.baseUrl,
    );
    dio.interceptors.add(providerInterceptor());
    return dio;
  }

  PrettyDioLogger providerInterceptor() {
    return PrettyDioLogger(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );
  }
}

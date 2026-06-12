import 'package:dio/dio.dart';
import 'package:genge_app/core/network/interceptors/auth_interceptor.dart';
import 'package:genge_app/core/network/interceptors/refresh_token_interceptor.dart';

import '../config/app_config.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late final Dio dio;

  DioClient._internal(){
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        }
      )
    );

    dio.interceptors.add(AuthInterceptor());

    dio.interceptors.add(RefreshTokenInterceptor(dio));
    
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true
      )
    );
  }
}
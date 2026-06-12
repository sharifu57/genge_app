import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest (
      RequestOptions options,
      RequestInterceptorHandler handler
      ) async {
    final token = await SecureStorage.getAccessToken();

    if(token != null && token.isNotEmpty){
      options.headers["authorization"] = "Bearer $token";
    }
    
    handler.next(options);
  }
}
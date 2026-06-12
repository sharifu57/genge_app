

import 'package:dio/dio.dart';
import 'package:genge_app/core/network/api_endpoints.dart';
import 'package:genge_app/core/storage/secure_storage.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;

  RefreshTokenInterceptor(this.dio);

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if(err.response?.statusCode != 401){
      return handler.next(err);
    }

    try{
      final refreshToken = await SecureStorage.getRefreshToken();

      if(refreshToken == null){
        return handler.next(err);
      }
      
      final response = await dio.post(ApiEndpoints.refreshToken, data: {"refreshToken": refreshToken});

      final newAccessToken = response.data["token"];
      final newRefreshToken = response.data["refreshToken"];

      await SecureStorage.saveAccessToken(newAccessToken);
      await SecureStorage.saveRefreshToken(newRefreshToken);

      final options = err.requestOptions;

      options.headers["Authorization"] = "Bearer $newAccessToken";

      final retryResponse = await dio.fetch(options);
      return handler.resolve(retryResponse);
    }catch(e){
      await SecureStorage.clearAll();
      return handler.next(err);
    }
  }
}
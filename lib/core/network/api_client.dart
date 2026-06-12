

import 'package:dio/dio.dart';
import 'package:genge_app/core/network/dio_client.dart';

class ApiClient {
  final Dio _dio = DioClient().dio;

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters,}) async {
      try{
        return await _dio.get(path, queryParameters: queryParameters);
      }on DioException catch(e){
        throw _handleError(e);
      }
  }

  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try{
      return await _dio.post(path, data: data, queryParameters: queryParameters);
    } on DioException catch(e) {
      throw _handleError(e);
    }
  }

  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try{
      return await _dio.put(path, data: data, queryParameters: queryParameters);
    }on DioException catch(e){
      throw _handleError(e);
    }
  }

  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try{
      return await _dio.delete(path, data: data, queryParameters: queryParameters);
    }on DioException catch(e){
      throw _handleError(e);
    }
  }

  String _handleError(DioException e){
    if(e.response != null){
      return e.response?.data['message']?? "Request Failed";
    }

    return e.message?? "Unknown error";
  }
}
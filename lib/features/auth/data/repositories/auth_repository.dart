import 'package:genge_app/core/network/api_client.dart';
import 'package:genge_app/core/network/api_endpoints.dart';
import 'package:genge_app/features/auth/data/models/sign_in_request.dart';

class AuthRepository {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> signIn(SignInRequest request) async {
    final response = await _apiClient.post(ApiEndpoints.signIn, data: request.toJson());
    return response.data;
  }
}
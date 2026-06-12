

import 'package:genge_app/core/network/api_client.dart';
import 'package:genge_app/core/network/api_endpoints.dart';
import 'package:genge_app/features/auth/data/models/otp_verify_request.dart';

class OtpRepository {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> otpVerification(OtpVerifyRequest request) async {
    final response = await _apiClient.post(ApiEndpoints.verifyOtp, data: request.toJson());
    return response.data;
  }
}
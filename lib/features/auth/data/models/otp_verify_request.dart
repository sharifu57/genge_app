class OtpVerifyRequest {
  final String phone;
  final String otp;

  OtpVerifyRequest({required this.phone, required this.otp});

  Map<String, dynamic> toJson(){
    return {
      "phone": phone,
      "otp": otp
    };
  }
}
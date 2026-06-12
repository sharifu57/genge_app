class SignInRequest {
  final String fullName;
  final String phone;

  SignInRequest({required this.fullName, required this.phone});

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "phone": phone
    };
  }
}
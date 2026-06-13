import 'dart:async';

import 'package:flutter/material.dart';
import 'package:genge_app/core/storage/secure_storage.dart';
import 'package:genge_app/core/widgets/app_loading.dart';
import 'package:genge_app/core/widgets/app_snackbar.dart';
import 'package:genge_app/data/models/otp_verify_request.dart';
import 'package:genge_app/data/repositories/otp_repository.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final otpController = TextEditingController();
  final secondsRemaining = 60.obs;

  final formKey = GlobalKey<FormState>();
  final OtpRepository _repository = OtpRepository();

  late final String phone;

  // String get phone => Get.arguments?["phone"]?? ""; //GETTER

  Timer? _timer;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    phone = Get.arguments?["phone"] ?? "";
    startTimer();
  }

  void startTimer() {
    secondsRemaining.value = 60;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value == 0) {
        timer.cancel();
      } else {
        secondsRemaining.value--;
      }
    });
  }

  Future<void> verifyOtp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    AppLoading.show();
    String otp = otpController.text.trim();

    try {
      final request = OtpVerifyRequest(phone: phone, otp: otp);
      final response = await _repository.otpVerification(request);

      if (response['status'] == true) {
        AppLoading.hide();

        final user = response['data'];
        await SecureStorage.saveUser(
          id: user['id'],
          fullName: user['fullName'],
          phone: user['phone'],
        );

        AppSnackBar.success(response['message'] ?? "Imefanikiwa.");
        Get.offAllNamed("/wrapper");
      } else {
        AppLoading.hide();
        AppSnackBar.error(response['message'] ?? "Imeshindikana.");
      }
    } catch (e) {
      AppLoading.hide();
      AppSnackBar.error(e.toString());
    }
  }

  Future<void> resendOtp() async {
    // Resend API
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}

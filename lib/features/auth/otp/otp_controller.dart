import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {

  final otpController = TextEditingController();
  final secondsRemaining = 60.obs;

  final formKey = GlobalKey<FormState>();

  final String phone =
      Get.arguments?["phone"] ?? "";

  Timer? _timer;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startTimer();
  }
  void startTimer(){
    secondsRemaining.value = 60;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer){
      if(secondsRemaining.value == 0){
        timer.cancel();
      }else{
        secondsRemaining.value--;
      }
    });
  }
  Future<void> verifyOtp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    // Call API
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
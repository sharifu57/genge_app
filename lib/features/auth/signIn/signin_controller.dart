import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signIn() {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        "Success",
        "OTP will be sent to ${phoneController.text}",
        snackPosition: SnackPosition.BOTTOM,
      );

      // TODO:
      // Call API
      // Navigate to OTP screen
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}

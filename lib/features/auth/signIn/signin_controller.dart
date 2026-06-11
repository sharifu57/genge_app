import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_loading.dart';

class SignInController extends GetxController {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    AppLoading.show();

    try {
      await Future.delayed(
        const Duration(seconds: 3),
      );

      AppLoading.hide();

      Get.snackbar(
        "Success",
        "OTP imetumwa",
      );

      // Navigate here
      // Get.toNamed('/otp');
    } catch (e) {
      AppLoading.hide();

      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    super.onClose();
  }


}

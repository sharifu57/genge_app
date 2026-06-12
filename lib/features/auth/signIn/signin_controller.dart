import 'package:flutter/material.dart';
import 'package:genge_app/core/storage/secure_storage.dart';
import 'package:genge_app/features/auth/data/models/sign_in_request.dart';
import 'package:genge_app/features/auth/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_loading.dart';

class SignInController extends GetxController {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final AuthRepository _repository = AuthRepository();

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    AppLoading.show();

    try{
      final request = SignInRequest(fullName: fullNameController.text.trim(), phone: phoneController.text.trim());
      final response = await _repository.signIn(request);

      if(response["status"] == true){
        if(response["token"] != null){
          await SecureStorage.saveAccessToken(response["token"]);
        }

        if (response["refreshToken"] != null) {
          await SecureStorage.saveRefreshToken(
            response["refreshToken"],
          );
        }

        AppLoading.hide();

        Get.snackbar(
          "Success",
          response["message"] ??
              "OTP imetumwa",
        );
      }else {
        AppLoading.hide();

        Get.snackbar(
          "Error",
          response["message"] ??
              "Imeshindikana",
        );
      }
    }catch (e) {
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

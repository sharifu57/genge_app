import 'package:flutter/material.dart';
import 'package:genge_app/core/storage/secure_storage.dart';
import 'package:genge_app/core/widgets/app_snackbar.dart';
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
    String phone = phoneController.text.trim();
    if(phone.startsWith('0')){
      phone = '255${phone.substring(1)}';
    }
    try{
      final request = SignInRequest(fullName: fullNameController.text.trim(), phone: phone);
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
        
        AppSnackBar.success(response["message"] ??
            "OTP imetumwa",);

        Get.offAllNamed("/otp", arguments: phone);

      }else {
        AppLoading.hide();
        
        AppSnackBar.error(response["message"] ??
            "Imeshindikana",);

      }
    }catch (e) {
      AppLoading.hide();
      AppSnackBar.error(e.toString());
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    super.onClose();
  }


}

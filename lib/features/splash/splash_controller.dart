import 'package:genge_app/features/onboarding/onboarding_binding.dart';
import 'package:genge_app/features/onboarding/onboarding_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    print("🚀 SplashController initialized");

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/onboarding');
    });
  }
}

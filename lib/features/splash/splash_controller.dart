import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 3), () {
      // Navigate later
      // Get.offNamed('/onboarding');
    });
  }
}

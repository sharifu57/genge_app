import 'package:genge_app/core/storage/secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {

    await Future.delayed(
      const Duration(seconds: 3),
    );

    final userId =
    await SecureStorage.getUserId();

    if (userId != null && userId.isNotEmpty) {
      Get.offAllNamed('/wrapper');
      return;
    }

    Get.offAllNamed('/onboarding');
  }
}
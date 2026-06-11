import 'package:get/get.dart';

import 'app_loader.dart';

class AppLoading {
  static void show() {
    Get.dialog(
      const AppLoader(),
      barrierDismissible: false,
    );
  }

  static void hide() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    print("Splash Binding Called");
    // Get.lazyPut(() => SplashController());
    Get.put(SplashController());
  }
}

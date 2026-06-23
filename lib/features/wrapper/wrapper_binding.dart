import 'package:genge_app/features/home/home_controller.dart';
import 'package:genge_app/features/wrapper/wrapper_controller.dart';
import 'package:get/get.dart';

class WrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WrapperController>(() => WrapperController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

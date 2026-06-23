import 'package:genge_app/features/cart/cart_controller.dart';
import 'package:get/get.dart';

class WrapperController extends GetxController {
  final CartController cartController = Get.find<CartController>();
  final selectedIndex = 0.obs;
  final cartCount = 3.obs;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;

    print("=====ARGS::: $args");

    if (args != null && args['tab'] != null) {
      selectedIndex.value = (args['tab'] ?? 0) as int;
    }
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void goToCart() {
    selectedIndex.value = 2;
  }
}

import 'package:genge_app/features/cart/cart_controller.dart';
import 'package:genge_app/features/product/product_controller.dart';
import 'package:get/get.dart';

class WrapperController extends GetxController {
  final CartController cartController = Get.find<CartController>();
  final selectedIndex = 0.obs;
  final cartCount = 3.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}

import 'package:genge_app/core/widgets/app_snackbar.dart';
import 'package:genge_app/data/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <ProductModel>[].obs;

  void addToCart(ProductModel product) {
    cartItems.add(product);
    AppSnackBar.success("${product.name}: Imeongezwa:");
  }

  void removeToCart(ProductModel product) {
    cartItems.remove(product);
    AppSnackBar.error("${product.name}: Imetolewa");
  }

  int get cartCount => cartItems.length;
}

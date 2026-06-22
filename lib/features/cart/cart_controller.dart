import 'package:genge_app/core/widgets/app_snackbar.dart';
import 'package:genge_app/data/models/cart_item.dart';
import 'package:genge_app/data/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;

  void addToCart(ProductModel product) {
    final index = cartItems.indexWhere(
      (item) => item.product.rowId == product.rowId,
    );
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(product: product, quantity: 1));
    }
    AppSnackBar.success("${product.name}: Imeongezwa:");
  }

  void removeToCart(ProductModel product) {
    cartItems.remove(product);
    AppSnackBar.error("${product.name}: Imetolewa");
  }

  int get cartCount => cartItems.fold(0, (sum, item) => sum + item.quantity);
}

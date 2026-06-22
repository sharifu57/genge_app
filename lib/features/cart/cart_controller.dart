import 'package:genge_app/core/widgets/app_snackbar.dart';
import 'package:genge_app/data/models/cart_item.dart';
import 'package:genge_app/data/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;

  void addToCart(ProductModel product, int quantity) {
    final index = cartItems.indexWhere(
      (item) => item.product.rowId == product.rowId,
    );

    if (index != -1) {
      cartItems[index].quantity += quantity;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(product: product, quantity: quantity));
    }

    AppSnackBar.success("${product.name} imeongezwa kwenye cart");
  }

  void removeToCart(ProductModel product) {
    cartItems.remove(product);
    AppSnackBar.error("${product.name}: Imetolewa");
  }

  int get cartCount => cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get cartTotal {
    return cartItems.fold(0.0, (sum, item) {
      final price =
          item.product.discountedPrice > 0 &&
              item.product.discountedPrice < item.product.price
          ? item.product.discountedPrice
          : item.product.price;

      return sum + (price * item.quantity);
    });
  }

  void increaseQuantity(String rowId) {
    final index = cartItems.indexWhere((e) => e.product.rowId == rowId);

    if (index != -1) {
      final item = cartItems[index];

      if (item.quantity < item.product.quantity) {
        item.quantity++;
        cartItems.refresh();
      }
    }
  }

  void decreaseQuantity(String rowId) {
    final index = cartItems.indexWhere((e) => e.product.rowId == rowId);

    if (index != -1) {
      final item = cartItems[index];

      if (item.quantity > 1) {
        item.quantity--;
        cartItems.refresh();
      }
    }
  }

  void removeItem(String rowId) {
    cartItems.removeWhere((item) => item.product.rowId == rowId);
  }
}

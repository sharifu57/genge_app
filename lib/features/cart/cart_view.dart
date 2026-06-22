import 'package:flutter/material.dart';
import 'package:genge_app/features/cart/cart_controller.dart';
import 'package:get/get.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("CART"));
  }
}

import 'package:flutter/material.dart';
import 'package:genge_app/features/product/product_controller.dart';
import 'package:get/get.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProductView'), centerTitle: true),
      body: const Center(
        child: Text('ProductView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

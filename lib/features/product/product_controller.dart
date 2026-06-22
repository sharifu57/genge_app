import 'package:flutter/material.dart';
import 'package:genge_app/core/widgets/app_snackbar.dart';
import 'package:genge_app/data/models/product_model.dart';
import 'package:genge_app/data/repositories/product/product_repository.dart';
import 'package:genge_app/features/cart/cart_controller.dart';
import 'package:genge_app/features/home/home_controller.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  late final String categoryRowId;
  final searchController = TextEditingController();
  final HomeController homeController = Get.find<HomeController>();
  final CartController cartController = Get.find<CartController>();

  final ProductRepository _productRepository = ProductRepository();
  final products = <ProductModel>[].obs;
  final isLoadingProducts = false.obs;

  final selectedCategory = "Zote".obs;
  final cartItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    categoryRowId = Get.arguments?["rowId"] ?? "";
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      isLoadingProducts.value = true;
      final results = await _productRepository.getProducts();
      products.assignAll(results);
    } catch (e) {
      print("Error loading products: $e");
    } finally {
      isLoadingProducts.value = false;
    }
  }

  Future<void> loadProductsByCategory(String categoryId) async {
    try {
      isLoadingProducts.value = true;
      final results = await _productRepository.getCategoryProducts(categoryId);
      products.assignAll(results);
    } finally {
      isLoadingProducts.value = false;
    }
  }

  void selectCategory(String category) {
    selectedCategory.value = category;

    if (category == "Zote" || category.isEmpty) {
      loadProducts();
    } else {
      loadProductsByCategory(category);
    }
  }

  // void addToCart(ProductModel product) {
  //   cartItems.add(product);

  //   AppSnackBar.success("Imeongezwa");
  // }
}

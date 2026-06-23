import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genge_app/core/theme/app_colors.dart';
import 'package:genge_app/core/theme/app_sizes.dart';
import 'package:genge_app/core/widgets/app_appbar.dart';
import 'package:genge_app/core/widgets/app_network_image.dart';
import 'package:genge_app/data/models/product_model.dart';
import 'package:genge_app/features/product/product_controller.dart';
import 'package:get/get.dart';

import '../../wrapper/wrapper_controller.dart';

class ViewOneProduct extends StatefulWidget {
  const ViewOneProduct({super.key});

  @override
  State<ViewOneProduct> createState() => _ViewOneProductState();
}

class _ViewOneProductState extends State<ViewOneProduct> {
  late ProductModel product;
  int quantity = 1;
  final ProductController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = Get.arguments as ProductModel;
  }

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        product.discountedPrice > 0 && product.discountedPrice < product.price;

    final displayPrice = hasDiscount ? product.discountedPrice : product.price;
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: CustomAppBar(
        title: product.name,
        onBack: () {
          Get.offAllNamed('/wrapper');
        },
        actions: [
          Obx(
            () => Stack(
              children: [
                IconButton(
                  onPressed: () {
                    // final wrapperController = Get.find<WrapperController>();
                    // wrapperController.changeTab(2);
                    // Get.offAllNamed("/wrapper");
                    Get.find<WrapperController>().goToCart();
                    Get.back();
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),

                if (controller.cartController.cartItems.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          controller.cartController.cartItems.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: quantity > 1
                        ? () {
                            setState(() {
                              quantity--;
                            });
                          }
                        : null,
                    icon: Icon(Icons.remove, size: 15.sp),
                  ),

                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                    onPressed: quantity < product.quantity
                        ? () {
                            setState(() {
                              quantity++;
                            });
                          }
                        : null,
                    icon: Icon(Icons.add, size: 15.sp),
                  ),
                ],
              ),
            ),

            SizedBox(width: 30.w),

            Expanded(
              child: SizedBox(
                height: 50.h,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.cartController.addToCart(product, quantity);
                  },
                  icon: Icon(Icons.shopping_cart, size: 12.sp),
                  label: Text(
                    "Ongeza ${product.unit} $quantity sawa na TZS ${(displayPrice * quantity).toStringAsFixed(0)}",
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: AppNetworkImage(imageUrl: product.imageUrl),
                    ),

                    Positioned(
                      top: 15.h,
                      right: 15.w,
                      child: Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          product.category.imageUrl,
                          style: TextStyle(fontSize: 22.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        product.category.name,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Row(
                      children: [
                        Text(
                          "TZS ${displayPrice.toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        if (hasDiscount) ...[
                          SizedBox(width: 8.w),

                          Text(
                            "TZS ${product.price.toStringAsFixed(0)}",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ],
                    ),

                    SizedBox(height: 10.h),

                    Card(
                      elevation: 0,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(14.r),
                        child: Row(
                          children: [
                            Icon(
                              Icons.inventory_2_outlined,
                              color: product.quantity > 0
                                  ? AppColors.primary
                                  : AppColors.error,

                              size: 14.sp,
                            ),

                            SizedBox(width: 10.w),

                            Text(
                              "${product.quantity} ${product.unit} ipo Stock",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: product.quantity > 0
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 14.h),

                    Text(
                      "Maelezo",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 13.sp,
                        height: 1.7,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genge_app/core/theme/app_colors.dart';
import 'package:genge_app/core/theme/app_sizes.dart';
import 'package:genge_app/core/utils/helper_function.dart';
import 'package:genge_app/core/widgets/app_network_image.dart';
import 'package:genge_app/features/cart/cart_controller.dart';
import 'package:get/get.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart"), centerTitle: true),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 40.sp,
                  color: Colors.grey,
                ),
                SizedBox(height: 15.h),
                Text(
                  "Cart yako haina bidhaa",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: controller.cartItems.length,
                separatorBuilder: (_, _) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];

                  final product = item.product;

                  final unitPrice =
                      product.discountedPrice > 0 &&
                          product.discountedPrice < product.price
                      ? product.discountedPrice
                      : product.price;

                  final subtotal = unitPrice * item.quantity;

                  return Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .05),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: SizedBox(
                            width: 80.w,
                            height: 80.w,
                            child: AppNetworkImage(imageUrl: product.imageUrl),
                          ),
                        ),

                        SizedBox(width: 12.w),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),

                              SizedBox(height: 4.h),

                              Text(
                                product.category.name,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11.sp,
                                ),
                              ),

                              SizedBox(height: 6.h),

                              Text(
                                HelperFunction.formatCurrency(unitPrice),
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                              ),

                              SizedBox(height: 8.h),

                              Row(
                                children: [
                                  _qtyButton(
                                    Icons.remove,
                                    () => controller.decreaseQuantity(
                                      product.rowId,
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                    ),
                                    child: Text(
                                      "${item.quantity} ${product.unit}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),

                                  _qtyButton(
                                    Icons.add,
                                    () => controller.increaseQuantity(
                                      product.rowId,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  controller.removeItem(product.rowId),
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                                size: 22.sp,
                              ),
                            ),

                            SizedBox(height: 10.h),

                            Text(
                              HelperFunction.formatCurrency(subtotal),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(18.r),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .08),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Jumla",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const Spacer(),

                      Text(
                        HelperFunction.formatCurrency(controller.cartTotal),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.fontLG,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),

                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag_outlined),
                      label: Text(
                        "Endelea Kulipa",
                        style: TextStyle(fontSize: AppSizes.fontXS),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, size: 16.sp),
      ),
    );
  }
}

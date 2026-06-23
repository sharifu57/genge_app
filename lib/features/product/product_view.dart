import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genge_app/core/theme/app_colors.dart';
import 'package:genge_app/core/theme/app_sizes.dart';
import 'package:genge_app/core/widgets/app_appbar.dart';
import 'package:genge_app/core/widgets/app_loader.dart';
import 'package:genge_app/core/widgets/app_network_image.dart';
import 'package:genge_app/core/widgets/app_text_field.dart';
import 'package:genge_app/data/models/product_model.dart';
import 'package:genge_app/features/product/product_controller.dart';
import 'package:genge_app/features/product/widgets/view_one_product.dart';
import 'package:get/get.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Products',
        onBack: () {
          Get.offAllNamed('/wrapper');
        },
        actions: [
          Obx(
            () => Stack(
              children: [
                IconButton(
                  onPressed: () {
                    // print(Get.isRegistered<WrapperController>());
                    // Get.find<WrapperController>().goToCart();
                    // Get.back();

                    Get.offAllNamed('/wrapper', arguments: {'tab': 2});
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
                        color: AppColors.error,
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
      body: Obx(() {
        if (controller.isLoadingProducts.value) {
          return const Center(child: AppLoader());
        }

        return Container(
          color: AppColors.surface,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontal),
            child: Column(
              children: [
                AppTextField(
                  controller: controller.searchController,
                  hintText: "Tafuta bidhaa",
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: AppColors.primary,
                  ),
                ),

                Expanded(
                  child: Obx(() {
                    return RefreshIndicator(
                      onRefresh: controller.loadProducts,
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          SizedBox(
                            height: 50,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _categoryChip(
                                  "Zote",
                                  controller.selectedCategory.value == "Zote",
                                  "",
                                ),

                                ...controller.homeController.categories.map(
                                  (category) => _categoryChip(
                                    category.name,
                                    controller.selectedCategory.value ==
                                        category.rowId,
                                    category.rowId,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: CustomScrollView(
                              slivers: [
                                SliverPadding(
                                  padding: EdgeInsets.only(
                                    top: 15.h,
                                    bottom: 20.h,
                                  ),
                                  sliver: SliverGrid(
                                    delegate: SliverChildBuilderDelegate((
                                      context,
                                      index,
                                    ) {
                                      final product =
                                          controller.products[index];

                                      return _productCard(product);
                                    }, childCount: controller.products.length),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 14.h,
                                          crossAxisSpacing: 14.w,
                                          childAspectRatio: 0.52,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _categoryChip(String title, bool selected, String selectedValue) {
    return GestureDetector(
      onTap: () {
        controller.selectCategory(selectedValue);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.white,

          borderRadius: BorderRadius.circular(20),

          border: Border.all(
            color: selected ? AppColors.primary : Colors.grey.shade300,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _productCard(ProductModel product) {
    final hasDiscount =
        product.discountedPrice > 0 && product.discountedPrice < product.price;
    final displayPrice = hasDiscount ? product.discountedPrice : product.price;

    return InkWell(
      onTap: () {
        Get.to(() => const ViewOneProduct(), arguments: product);
      },
      child: Card(
        elevation: 0.4,
        child: Container(
          decoration: BoxDecoration(
            // color: AppColors.surface,
            borderRadius: BorderRadius.circular(
              16.r,
            ), // Slightly tighter radius for a modern feel
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r),
                        ),
                        child: AppNetworkImage(imageUrl: product.imageUrl),
                      ),
                    ),
                    Positioned(
                      top: 8.r,
                      right: 8.r,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Text(
                          product
                              .category
                              .imageUrl, // Assuming this contains an emoji string
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(10.r, 10.r, 10.r, 8.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.name,
                      maxLines:
                          1, // Tightened to 1 line for crisp catalog look, or keep 2 if needed
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      product.category.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 6.h),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "TZS ${displayPrice.toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        if (hasDiscount) ...[
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              "TZS ${product.price.toStringAsFixed(0)}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10.sp,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: 6.h),

                    Row(
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 12.sp,
                          color: product.quantity > 0
                              ? AppColors.success
                              : AppColors.error,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            "Stock: ${product.quantity} ${product.unit}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10.5.sp,
                              fontWeight: FontWeight.w600,
                              color: product.quantity > 0
                                  ? AppColors.success
                                  : AppColors.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),

                    Obx(() {
                      final exists = controller.cartController.cartItems.any(
                        (item) => item.product.rowId == product.rowId,
                      );

                      return SizedBox(
                        width: double.infinity,
                        height: 32.h,
                        child: ElevatedButton(
                          onPressed: exists
                              ? null
                              : () => controller.cartController.addToCart(
                                  product,
                                  1,
                                ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            exists ? "Imeongezwa" : "Ongeza",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
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

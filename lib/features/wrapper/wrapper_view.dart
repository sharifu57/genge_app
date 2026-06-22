import 'package:flutter/material.dart';
import 'package:genge_app/core/theme/app_colors.dart';
import 'package:genge_app/core/theme/app_sizes.dart';
import 'package:genge_app/core/widgets/home_app_bar.dart';
import 'package:genge_app/features/cart/cart_view.dart';
import 'package:genge_app/features/orders/order_view.dart';
import 'package:genge_app/features/product/product_controller.dart';
import 'package:genge_app/features/profile/profile_view.dart';
import 'package:get/get.dart';

import 'package:genge_app/core/widgets/animated_bottom_nav.dart';
import 'package:genge_app/features/home/home_view.dart';
import 'package:genge_app/features/wrapper/wrapper_controller.dart';

class WrapperView extends GetView<WrapperController> {
  const WrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = const [HomeView(), OrderView(), CartView(), ProfileView()];

    return Obx(() {
      return Scaffold(
        appBar: HomeAppBar(),
        body: Container(
          color: AppColors.surface,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.horizontal,
              vertical: AppSizes.vertical,
            ),
            child: IndexedStack(
              index: controller.selectedIndex.value,
              children: pages,
            ),
          ),
        ),

        bottomNavigationBar: AnimatedBottomNav(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          cartCount: controller.cartController.cartItems.length,
        ),
      );
    });
  }
}

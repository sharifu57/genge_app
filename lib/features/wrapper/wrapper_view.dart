import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:genge_app/core/widgets/animated_bottom_nav.dart';
import 'package:genge_app/features/home/home_view.dart';
import 'package:genge_app/features/wrapper/wrapper_controller.dart';

class WrapperView extends GetView<WrapperController> {
  const WrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = const [
      HomeView(),
    ];

    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),

        bottomNavigationBar: AnimatedBottomNav(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          cartCount: controller.cartCount.value,
        ),
      );
    });
  }
}
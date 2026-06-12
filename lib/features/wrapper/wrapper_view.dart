

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genge_app/core/theme/app_colors.dart';
import 'package:genge_app/core/widgets/animated_bottom_nav.dart';
import 'package:genge_app/features/home/home_view.dart';
import 'package:genge_app/features/wrapper/wrapper_controller.dart';
import 'package:get/get.dart';

class WrapperView extends GetView<WrapperController> {
  const WrapperView({super.key});

  final pages = const [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView()
  ];

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),

        bottomNavigationBar: AnimatedBottomNav(currentIndex: controller.selectedIndex.value, onTap: controller.changeTab, cartCount: controller.cartCount.value),
      );
    });
  }
}
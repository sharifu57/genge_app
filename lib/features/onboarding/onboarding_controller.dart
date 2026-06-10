import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding_model.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  RxInt currentPage = 0.obs;

  final pages = [
    OnboardingModel(
      lottie: "assets/lotties/grocery.json",
      title: "Karibu GENGE",
      description:
          "Nunua mboga, matunda, nyama na bidhaa za kila siku kwa urahisi.",
    ),

    OnboardingModel(
      lottie: "assets/lotties/shopping_cart.json",
      title: "Chagua Unachohitaji",
      description:
          "Tafuta bidhaa, ongeza kwenye kapu na fanya oda ndani ya sekunde.",
    ),

    OnboardingModel(
      lottie: "assets/lotties/delivery.json",
      title: "Lipa na Pokea",
      description:
          "Lipa kwa M-Pesa, Airtel Money au Airtel Money na upokee oda yako nyumbani.",
    ),
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO Navigate Login
      // Get.offAllNamed(AppRoutes.login);
    }
  }

  void skip() {
    // TODO Navigate Login
    // Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

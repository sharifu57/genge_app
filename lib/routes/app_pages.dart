import 'package:genge_app/features/auth/otp/otp_binding.dart';
import 'package:genge_app/features/auth/otp/otp_view.dart';
import 'package:genge_app/features/auth/signIn/signIn_binding.dart';
import 'package:genge_app/features/auth/signIn/signIn_view.dart';
import 'package:genge_app/features/home/home_binding.dart';
import 'package:genge_app/features/home/home_view.dart';
import 'package:genge_app/features/onboarding/onboarding_binding.dart';
import 'package:genge_app/features/onboarding/onboarding_view.dart';
import 'package:genge_app/features/product/product_binding.dart';
import 'package:genge_app/features/product/product_view.dart';
import 'package:genge_app/features/wrapper/wrapper_binding.dart';
import 'package:genge_app/features/wrapper/wrapper_view.dart';
import 'package:get/get.dart';

import '../features/splash/splash_binding.dart';
import '../features/splash/splash_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: '/onboarding',
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),

    GetPage(
      name: '/signin',
      page: () => SignInView(),
      binding: SignInBinding(),
    ),

    GetPage(name: "/otp", page: () => OtpView(), binding: OtpBinding()),
    GetPage(
      name: '/home',
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: '/wrapper',
      page: () => const WrapperView(),
      binding: WrapperBinding(),
    ),

    GetPage(
      name: '/product',
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),

  ];
}

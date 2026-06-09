import 'package:get/get.dart';

import '../features/splash/splash_binding.dart';
import '../features/splash/splash_view.dart';

class AppPages {
  static const INITIAL = '/';

  static final routes = [
    GetPage(
      name: '/',
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}

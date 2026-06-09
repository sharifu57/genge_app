import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genge_app/core/theme/app_theme.dart';
import 'package:genge_app/features/splash/splash_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // base design (iPhone 11/12/13)
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,

          // ✅ YOUR THEME (Poppins will now work)
          theme: AppTheme.lightTheme,

          // optional: keeps navigation clean
          defaultTransition: Transition.fade,

          // ✅ INITIAL SCREEN
          home: const SplashView(),
        );
      },
    );
  }
}

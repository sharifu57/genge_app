import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genge_app/core/theme/app_theme.dart';
import 'package:genge_app/features/cart/cart_controller.dart';
import 'package:genge_app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  Get.put(CartController(), permanent: true); //WE SET IT GLOBALY
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
          theme: AppTheme.lightTheme,
          defaultTransition: Transition.fade,
          initialRoute: '/splash',
          getPages: AppPages.routes,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:genge_app/core/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppSnackBar {
  AppSnackBar._();

  static void success(String message, {String title='success'}){
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.success,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );


  }

  static void error(String message, {String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.error,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      duration: const Duration(seconds: 4),
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }

  static void warning(String message, {String title = 'Warning'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.secondary,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      duration: const Duration(seconds: 4),
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
    );
  }

  static void info(String message, {String title = 'Information'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.accent,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Icons.info,
        color: Colors.white,
      ),
    );
  }
}
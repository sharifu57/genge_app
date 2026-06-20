import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBack;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onBack,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.white,
      elevation: 0,
      centerTitle: true,

      leading: showBackButton
          ? Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: GestureDetector(
                onTap: onBack ?? Get.back,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 14.sp,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            )
          : null,

      title: Text(
        title,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),

      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}

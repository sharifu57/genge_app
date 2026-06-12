
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../features/home/home_controller.dart';
import '../theme/app_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {

  final int notificationCount;
  final VoidCallback? onNotificationTap;

  HomeAppBar({
    super.key,
    this.notificationCount = 0,
    this.onNotificationTap,
  });

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 16.w,

        title: Row(
          children: [
            Icon(Icons.location_on, color: AppColors.primary, size: 18.sp),

            SizedBox(width: 6.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Deliver to", style: TextStyle(fontSize: 11)),

                  controller.isLoadingLocation.value
                      ? const SizedBox(
                    height: 12,
                    width: 12,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : Text(
                    controller.locationName.value,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: onNotificationTap,
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.notifications_none,
                        color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
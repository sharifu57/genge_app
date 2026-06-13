import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genge_app/core/theme/app_colors.dart';
import 'package:genge_app/core/theme/app_sizes.dart';
import 'package:genge_app/core/widgets/app_text_field.dart';
import 'package:genge_app/features/home/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HomeAppBar(),
      body: Column(
        children: [
          SizedBox(height: 10.h),

          Container(
            alignment: Alignment.centerLeft,
            child: Wrap(
              children: [
                Obx(
                  () => Row(
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        "Karibu, ",
                        style: TextStyle(
                          fontSize: AppSizes.fontMD,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondary,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        controller.fullName.value,
                        style: TextStyle(
                          fontSize: AppSizes.fontSM,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          AppTextField(
            controller: controller.searchController,
            hintText: "Tafuta bidhaa",
            prefixIcon: Icon(CupertinoIcons.search, color: AppColors.primary),
          ),

          SizedBox(height: 20.h),

          //MAKE A BARNER WITH A BACKGROUNG IMAGE OF VEGETABLES AND ON FRONT A BUTTON FOR ORDER NOW
          Container(
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Stack(
                children: [
                  /// Background Image
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/groceries.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Primary Color Overlay
                  Positioned.fill(
                    child: Container(
                      color: AppColors.primary.withValues(alpha: 0.65),
                    ),
                  ),

                  /// Content
                  Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.all(18.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "OFA YA LEO",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppSizes.fontXS,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          SizedBox(height: 3.h),

                          Text(
                            "Mboga fresh kutoka shamba",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppSizes.fontLG - 2.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5.h),

                          Text(
                            "Pata punguzo la 20% + usafirishaji bure",
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontSize: AppSizes.fontSM - 2.sp,
                            ),
                          ),

                          const Spacer(),

                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Agiza Sasa",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: AppSizes.fontSM - 2.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondary,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.w,
                                vertical: 10.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                side: BorderSide(
                                  color: Colors.white.withValues(alpha: 0.3),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

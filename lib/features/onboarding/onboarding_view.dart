import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import 'onboarding_controller.dart';
import 'widgets/onboarding_page.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            /// Skip
            Padding(
              padding: EdgeInsets.only(top: 10.h, right: 20.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.skip,
                  child: Text(
                    "Ruka",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.pages.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (_, index) {
                  final page = controller.pages[index];

                  return OnboardingPage(
                    lottie: page.lottie,
                    title: page.title,
                    description: page.description,
                  );
                },
              ),
            ),

            /// Bottom
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: Row(
                children: [
                  /// Indicators
                  Obx(
                    () => Row(
                      children: List.generate(controller.pages.length, (index) {
                        bool isActive = controller.currentPage.value == index;

                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),

                          margin: EdgeInsets.only(right: 6.w),

                          width: isActive ? 28.w : 8.w,
                          height: 8.h,

                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.primary
                                : Colors.grey.shade300,

                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      }),
                    ),
                  ),

                  const Spacer(),

                  /// Next Button
                  ElevatedButton(
                    onPressed: controller.nextPage,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,

                      padding: EdgeInsets.symmetric(
                        horizontal: 28.w,
                        vertical: 14.h,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),

                    child: Text(
                      "Endelea",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

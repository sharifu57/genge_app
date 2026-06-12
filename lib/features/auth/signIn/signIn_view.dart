import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genge_app/core/theme/app_sizes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_logo.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import 'signin_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.40,

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primary, Color(0xFF22C55E)],
                ),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
              ),

              child: Stack(
                children: [
                  Positioned(
                    top: -40,
                    right: -30,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: .08),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: -60,
                    left: -20,
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: .08),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 100,
                    left: -40,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: .05),
                      ),
                    ),
                  ),

                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(18.r),

                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.circular(28.r),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: .08),
                                  blurRadius: 25,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),

                            child: const AppLogo(height: 70),
                          ),

                          SizedBox(height: 20.h),

                          Text(
                            "Karibu GENGE",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: AppSizes.fontXL,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Text(
                              "Agiza mboga, matunda, nyama na bidhaa za kila siku kwa urahisi.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: AppSizes.fontMD,
                                color: Colors.white.withValues(alpha: .9),
                                height: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Transform.translate(
              offset: Offset(0, -45.h),

              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),

                padding: EdgeInsets.all(24.r),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(32.r),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .06),
                      blurRadius: 30,
                      spreadRadius: 2,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),

                child: Form(
                  key: controller.formKey,

                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 8.h,
                        ),

                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: .1),

                          borderRadius: BorderRadius.circular(30),
                        ),

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.local_grocery_store,
                              color: AppColors.primary,
                              size: 18.sp,
                            ),

                            SizedBox(width: 5.w),

                            Text(
                              "Fresh Grocery Delivery",
                              style: GoogleFonts.plusJakartaSans(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Text(
                        "Ingia",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        "Weka taarifa zako kuendelea",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      SizedBox(height: 30.h),

                      AppTextField(
                        controller: controller.fullNameController,
                        hintText: "Jina Kamili",
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: AppColors.primary,
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Jaza jina kamili";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 18.h),

                      AppTextField(
                        controller: controller.phoneController,
                        hintText: "07XXXXXXXX",
                        keyboardType: TextInputType.phone,

                        prefixIcon: const Icon(
                          Icons.phone_outlined,
                          color: AppColors.primary,
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Jaza namba ya simu";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 30.h),

                      AppButton(
                        text: "Endelea",
                        icon: Icons.arrow_forward,
                        backgroundColor: AppColors.primary,
                        onPressed: controller.signIn,
                        textColor: Colors.white,
                      ),

                      SizedBox(height: 20.h),

                      /// Security Label
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),

                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: .08),

                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.verified_user,
                              color: AppColors.success,
                              size: 16.sp,
                            ),

                            SizedBox(width: 5.w),

                            Text(
                              "Salama na Rahisi",
                              style: GoogleFonts.plusJakartaSans(
                                color: AppColors.success,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),

              child: Text(
                "Kwa kuendelea unakubali Sheria na Masharti ya GENGE",
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: AppSizes.fontSM,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

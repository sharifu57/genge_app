import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genge_app/core/theme/app_logo.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import 'signin_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),

          child: Form(
            key: controller.formKey,

            child: Column(
              children: [
                SizedBox(height: 50.h),
                AppLogo(),

                SizedBox(height: 20.h),

                Text(
                  "Karibu GENGE",
                  style: GoogleFonts.poppins(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  "Ingiza taarifa zako kuendelea",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(height: 50.h),

                AppTextField(
                  controller: controller.fullNameController,
                  hintText: "Jina Kamili",
                  prefixIcon: const Icon(Icons.person_outline),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Jaza jina kamili";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20.h),

                AppTextField(
                  controller: controller.phoneController,
                  hintText: "07XXXXXXXX",
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(Icons.phone_outlined),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Jaza namba ya simu";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 35.h),

                SizedBox(
                  width: double.infinity,
                  height: 55.h,

                  child: AppButton(
                    text: "Endelea",
                    onPressed: controller.signIn,
                    backgroundColor: AppColors.primary,
                  )
                ),

                SizedBox(height: 25.h),

                Text(
                  "Kwa kuendelea unakubali Sheria na Masharti ya GENGE",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

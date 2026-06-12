import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genge_app/core/theme/app_colors.dart';
import 'package:genge_app/core/widgets/app_button.dart';
import 'package:genge_app/features/auth/otp/otp_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 55.w,
      height: 60.h,
      textStyle: GoogleFonts.plusJakartaSans(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: AppColors.primary,
        width: 2,
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: AppColors.primary.withValues(alpha: .05),
      border: Border.all(
        color: AppColors.primary,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 20.h,
          ),

          child: Form(
            key: controller.formKey,

            child: Column(
              children: [
                SizedBox(height: 40.h),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.sms_outlined,
                        color: AppColors.success,
                        size: 18.sp,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        "OTP Imetumwa",
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.success,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                Container(
                  width: 90.w,
                  height: 90.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withValues(alpha: .1),
                  ),
                  child: Icon(
                    Icons.lock_outline,
                    color: AppColors.primary,
                    size: 42.sp,
                  ),
                ),

                SizedBox(height: 25.h),

                Text(
                  "Thibitisha OTP",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  "Weka tarakimu 6 zilizotumwa kwenye simu yako",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13.sp,
                    color: AppColors.textSecondary,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  controller.phone,
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),

                SizedBox(height: 40.h),

                Pinput(
                  controller: controller.otpController,
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,

                  validator: (value) {
                    if (value == null || value.length != 6) {
                      return "Weka OTP sahihi";
                    }
                    return null;
                  },

                  onCompleted: (pin) {
                    controller.verifyOtp();
                  },
                ),

                SizedBox(height: 35.h),

                AppButton(
                  text: "Thibitisha",
                  icon: Icons.check_circle_outline,
                  backgroundColor: AppColors.primary,
                  textColor: Colors.white,
                  onPressed: controller.verifyOtp,
                ),

                SizedBox(height: 25.h),

                Obx(
                      () => controller.secondsRemaining.value > 0
                      ? Text(
                    "Tuma tena baada ya sekunde ${controller.secondsRemaining.value}",
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textSecondary,
                    ),
                  )
                      : TextButton(
                    onPressed: controller.resendOtp,
                    child: Text(
                      "Tuma OTP Tena",
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: .08),
                    borderRadius: BorderRadius.circular(20.r),
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
                        "Muamala Salama",
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  final String lottie;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.lottie,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [Color(0xFFF8FFF9), Color(0xFFFFFFFF)],
        // ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),

            Expanded(
              child: Hero(
                tag: lottie,
                child: Lottie.asset(
                  lottie,
                  repeat: true,
                  fit: BoxFit.contain,
                  height: 100.h,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),

            SizedBox(height: 16.h),

            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                height: 1.6,
                color: Colors.grey.shade600,
              ),
            ),

            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }
}

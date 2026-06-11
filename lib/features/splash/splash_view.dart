import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genge_app/features/splash/splash_controller.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      body: const Stack(
        children: [
          _SoftFloatingShapes(),
          Center(child: _CleanSplash()),
        ],
      ),
    );
  }
}

class _SoftFloatingShapes extends StatefulWidget {
  const _SoftFloatingShapes();

  @override
  State<_SoftFloatingShapes> createState() => _SoftFloatingShapesState();
}

class _SoftFloatingShapesState extends State<_SoftFloatingShapes>
    with SingleTickerProviderStateMixin {
  late AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        return Stack(
          children: [
            _circle(90, 0.2, 0.1, Colors.white),
            _circle(140, 0.7, 0.2, Colors.white),
            _circle(70, 0.5, 0.8, Colors.white),
          ],
        );
      },
    );
  }

  Widget _circle(double size, double dx, double dy, Color color) {
    return Positioned(
      left: 80 + (dx * 120 * _c.value),
      top: 120 + (dy * 220 * (1 - _c.value)),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08), // soft white on green
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _CleanSplash extends StatefulWidget {
  const _CleanSplash();

  @override
  State<_CleanSplash> createState() => _CleanSplashState();
}

class _CleanSplashState extends State<_CleanSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _c;

  late Animation<double> scale;
  late Animation<double> fade;
  late Animation<Offset> slide;

  @override
  void initState() {
    super.initState();

    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    scale = CurvedAnimation(parent: _c, curve: Curves.easeOutBack);

    fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _c, curve: const Interval(0.0, 0.6)));

    slide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _c, curve: Curves.easeOutCubic));

    _c.forward();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: scale.value,
              child: Opacity(
                opacity: fade.value,
                child: SvgPicture.asset(
                  'assets/svg/genge_logo.svg',
                  height: 100.h,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // TITLE
            SlideTransition(
              position: slide,
              child: Opacity(
                opacity: fade.value,
                child: Text(
                  "GENGE",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 7,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // SUBTITLE
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.2),
                end: Offset.zero,
              ).animate(_c),
              child: Opacity(
                opacity: fade.value,
                child: Text(
                  "Nunua Vyakula kwa Urahisi",
                  style: TextStyle(fontSize: 12.sp, color: Colors.white70),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

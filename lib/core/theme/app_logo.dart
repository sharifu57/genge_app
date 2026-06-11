import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({super.key});

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  late Animation<double> fade;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    fade = Tween<double>(begin: 0, end: 1).animate(_c);
    _c.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: fade.value,
      child: SvgPicture.asset('assets/svg/genge_logo.svg', height: 100.h),
    );
  }
}

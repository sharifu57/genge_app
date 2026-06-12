import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genge_app/core/theme/app_colors.dart';

class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final int cartCount;

  const AnimatedBottomNav({super.key, required this.currentIndex, required this.onTap, required this.cartCount});

  Widget buildItem({
    required IconData icon,
    required String label,
    required int index,
    Widget? badge
  }){
    final isActive = currentIndex == index;
    
    return Expanded(child: GestureDetector(
      onTap: ()=> onTap(index),
      child: AnimatedContainer(duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isActive? AppColors.primary.withValues(alpha: 0.1): Colors.transparent,
          borderRadius: BorderRadius.circular(18.r)
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  icon,
                  color: isActive ? Colors.green : Colors.grey,
                  size: isActive ? 22 : 18,
                ),

                if (badge != null)
                  Positioned(
                    right: -8,
                    top: -6,
                    child: badge,
                  ),
              ],
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: isActive ? 10 : 9,
                color: isActive ? Colors.green : Colors.grey,
                fontWeight:
                isActive ? FontWeight.bold : FontWeight.normal,
              ),
              child: Text(label),
            ),
          ],
        ),

      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withValues(alpha: 0.08),
          )
        ],
      ),
      child: Row(
        children: [
          buildItem(
            icon: Icons.home,
            label: "Mwanzo",
            index: 0,
          ),
          buildItem(
            icon: Icons.receipt_long,
            label: "Oda",
            index: 1,
          ),
          buildItem(
            icon: Icons.shopping_cart,
            label: "Kikapu",
            index: 2,
            badge: cartCount > 0
                ? Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                "$cartCount",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            )
                : null,
          ),
          buildItem(
            icon: Icons.person,
            label: "Akaunti",
            index: 3,
          ),
        ],
      ),
    );
  }
}

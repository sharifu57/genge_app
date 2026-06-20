import 'package:flutter/material.dart';
import 'package:genge_app/core/theme/app_colors.dart';
import 'package:genge_app/core/theme/app_sizes.dart';

class FavoriteProducts extends StatelessWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Bidhaa Unazopenda",
              style: TextStyle(
                fontSize: AppSizes.fontMD,
                fontWeight: FontWeight.w600,
              ),
            ),

            TextButton(
              onPressed: () {},
              child: Text(
                "Zote",
                style: TextStyle(
                  fontSize: AppSizes.fontSM,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 10),

        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Replace with actual product count
            itemBuilder: (context, index) {
              return Container(
                width: 120,
                margin: EdgeInsets.only(right: 10),
                color: Colors.grey[300], // Placeholder for product image
                child: Center(child: Text("Bidhaa ${index + 1}")),
              );
            },
          ),
        ),
      ],
    );
  }
}

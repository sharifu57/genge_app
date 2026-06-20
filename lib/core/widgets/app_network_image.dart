import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;

  const AppNetworkImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,

      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;

        return Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        );
      },

      errorBuilder: (_, _, _) {
        return Container(
          color: Colors.grey.shade100,
          child: const Center(
            child: Icon(Icons.image_not_supported_outlined, size: 40),
          ),
        );
      },
    );
  }
}

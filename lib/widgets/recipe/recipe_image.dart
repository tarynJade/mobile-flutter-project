import 'package:flutter/material.dart';

class RecipeImage extends StatelessWidget {
  final String? imageUrl;

  const RecipeImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) return const SizedBox.shrink();
    return Image.network(
      imageUrl!,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey[300],
          child: Icon(Icons.restaurant, size: 60, color: Colors.grey[600]),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class FavoriteHeart extends StatelessWidget {
  final bool isInitiallyLiked;
  final Function(bool) onFavoriteChanged;
  final double size;

  const FavoriteHeart({
    super.key,
    this.isInitiallyLiked = false,
    required this.onFavoriteChanged,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isInitiallyLiked ? Icons.favorite : Icons.favorite_border,
        color: isInitiallyLiked ? Colors.red : Colors.grey,
        size: size,
      ),
      onPressed: () {
        onFavoriteChanged(!isInitiallyLiked);
      },
    );
  }
}
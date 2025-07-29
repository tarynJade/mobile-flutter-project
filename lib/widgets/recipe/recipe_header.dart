import 'package:flutter/material.dart';
import '../../../models/recipe.dart';
import '../../../services/favourites_manager.dart';
import '../like_button.dart';

class RecipeHeader extends StatefulWidget {
  final Recipe recipe;

  const RecipeHeader({super.key, required this.recipe});

  @override
  State<RecipeHeader> createState() => _RecipeHeaderState();
}

class _RecipeHeaderState extends State<RecipeHeader> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = FavouritesManager().isRecipeFavourite(widget.recipe.id);
  }

  void _handleFavoriteChanged(bool isLiked) async {
    setState(() {
      _isLiked = isLiked;
    });
    
    if (isLiked) {
      await FavouritesManager().addFavourite(widget.recipe);
    } else {
      await FavouritesManager().removeFavourite(widget.recipe.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.recipe.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        FavoriteHeart(
          isInitiallyLiked: _isLiked,
          onFavoriteChanged: _handleFavoriteChanged,
          size: 32.0,
        ),
      ],
    );
  }
}
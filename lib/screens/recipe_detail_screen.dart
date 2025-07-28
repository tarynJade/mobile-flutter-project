import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/api_service.dart';
import '../widgets/error_message.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/recipe/recipe_content.dart';
import 'home_screen.dart';
import 'favourite_screen.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late Future<Recipe> _fullRecipe;

  @override
  void initState() {
    super.initState();
    _fullRecipe = ApiService().fetchRecipeDetails(widget.recipe.id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.recipe.title),
        ),
        body: FutureBuilder<Recipe>(
          future: _fullRecipe,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError || !snapshot.hasData) {
              return ErrorMessage(
                message: snapshot.hasError
                    ? 'Error loading recipe: ${snapshot.error}'
                    : 'Recipe details not available',
              );
            }

            final recipe = snapshot.data!;
            return RecipeContent(recipe: recipe);
          },
        ),
        bottomNavigationBar: AppBottomNavBar(
          currentIndex: -1,
          onTabTapped: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen()),
              );
            }
          },
        ),
      ),
    );
  }
}


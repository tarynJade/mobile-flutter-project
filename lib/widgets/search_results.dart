import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';

class SearchResultsView extends StatelessWidget {
  final List<Recipe> recipes;
  final bool isLoading;
  final bool hasSearched;
  final String errorMessage;

  const SearchResultsView({
    super.key,
    required this.recipes,
    required this.isLoading,
    required this.hasSearched,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (recipes.isEmpty && hasSearched) {
      return Center(
        child: Text(
          errorMessage.isNotEmpty
              ? 'Error: $errorMessage'
              : 'No recipes found. Try searching for other ingredients!',
              style: TextStyle(color: Colors.red, fontSize: 16.0),
        ),
      );
    } 

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: recipes.length > 6 ? 6 : recipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return RecipeCard(recipe: recipes[index]);
      },
    );
  }
}

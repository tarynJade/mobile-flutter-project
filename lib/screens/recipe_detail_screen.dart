import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/api_service.dart';
import '../widgets/error_message.dart';
import '../widgets/instructions_steps.dart';
import '../services/text_utils.dart';


class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late Future<Recipe> _fullRecipe;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _fullRecipe = ApiService().fetchRecipeDetails(widget.recipe.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.title)),
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
          final ingredients = recipe.ingredients ?? [];
          final cleanedInstructions = TextUtils.cleanInstructions(recipe.instructions);

          return _buildRecipeContent(recipe, ingredients, cleanedInstructions);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) => setState(() => currentPage = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }

  /// Builds the main content of the recipe detail screen.
  Widget _buildRecipeContent(Recipe recipe, List<String> ingredients, List<String> instructions) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (recipe.image != null && recipe.image!.isNotEmpty)
            Image.network(
              recipe.image!,
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
            ),
          const SizedBox(height: 16),

          Text('Ingredients:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 6),
          if (ingredients.isNotEmpty)
            ...ingredients.map((e) => Text('• $e'))
          else
            const Text('No ingredients available'),
          const SizedBox(height: 16),

          Text('Instructions:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 6),
          if (instructions.isNotEmpty)
            InstructionSteps(steps: instructions)
          else
            const Text('No instructions available'),
        ],
      ),
    );
  }
}

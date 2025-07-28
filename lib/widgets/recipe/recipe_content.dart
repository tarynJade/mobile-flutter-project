import 'package:flutter/material.dart';
import '../../../models/recipe.dart';
import '../../../services/text_utils.dart';
import '../instructions_steps.dart';
import 'recipe_image.dart';
import 'recipe_header.dart';
import 'section_title.dart';

class RecipeContent extends StatelessWidget {
  final Recipe recipe;

  const RecipeContent({super.key, required this.recipe});

@override
Widget build(BuildContext context) {
  final ingredients = recipe.ingredients ?? [];
  final instructions = TextUtils.cleanInstructions(recipe.instructions);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Header section - NOT inside Expanded to ensure visibility
      SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeImage(imageUrl: recipe.image),
            const SizedBox(height: 16),
            RecipeHeader(recipe: recipe), 
            const SizedBox(height: 16),
          ],
        ),
      ),

      const TabBar(
        labelColor: Colors.black,
        tabs: [
          Tab(text: 'Ingredients'),
          Tab(text: 'Instructions'),
        ],
      ),

      // TabBar content - use Expanded here to fill remaining space
      Expanded(
        child: TabBarView(
          children: [
            // Ingredients
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(title: 'Ingredients:'),
                  const SizedBox(height: 6),
                  if (ingredients.isNotEmpty)
                    ...ingredients.map((e) => Text('• $e'))
                  else
                    const Text('No ingredients available'),
                ],
              ),
            ),

            // Instructions
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(title: 'Instructions:'),
                  const SizedBox(height: 6),
                  instructions.isNotEmpty
                      ? InstructionSteps(steps: instructions)
                      : const Text('No instructions available'),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
}

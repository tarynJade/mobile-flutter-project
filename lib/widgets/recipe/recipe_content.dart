import 'package:flutter/material.dart';
import '../../../models/recipe.dart';
import 'recipe_image.dart';
import 'recipe_header.dart';
import 'section_title.dart';

class RecipeContent extends StatelessWidget {
  final Recipe recipe;

  const RecipeContent({super.key, required this.recipe});

@override
Widget build(BuildContext context) {
  final ingredients = recipe.ingredients ?? [];
  final instruction = recipe.analyzedInstructions;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SingleChildScrollView(
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

      Expanded(
        child: TabBarView(
          children: [
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

            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(title: 'Instructions:'),
                  const SizedBox(height: 6),
                  (instruction ?? []).isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (instruction ?? []).join('\n\n'), 
                            ),
                          ],
                        )
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

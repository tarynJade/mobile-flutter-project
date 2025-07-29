import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ada_flutter_project/models/recipe.dart';
import 'package:ada_flutter_project/widgets/recipe_card.dart';


void main() {
  testWidgets('RecipeCard displays recipe title', (WidgetTester tester) async {
    final recipe = Recipe(id: 1, title: 'Pasta', image: '', ingredients: [], analyzedInstructions: []);
    await tester.pumpWidget(
      MaterialApp(
        home: RecipeCard(recipe: recipe),
      ),
    );

    expect(find.text('Pasta'), findsOneWidget);
  });
}

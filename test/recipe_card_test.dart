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

  testWidgets('RecipeCard does not display image if image URL is empty', (WidgetTester tester) async {
    final recipe = Recipe(
      id: 3,
      title: 'Soup',
      image: '',
      ingredients: [],
      analyzedInstructions: [],
    );
    await tester.pumpWidget(
      MaterialApp(
        home: RecipeCard(recipe: recipe),
      ),
    );

    expect(find.byType(Image), findsNothing);
  });

  testWidgets('RecipeCard handles long titles with ellipsis', (WidgetTester tester) async {
    final longTitle = 'A very long recipe title that should be truncated with an ellipsis at the end';
    final recipe = Recipe(
      id: 4,
      title: longTitle,
      image: '',
      ingredients: [],
      analyzedInstructions: [],
    );
    await tester.pumpWidget(
      MaterialApp(
        home: RecipeCard(recipe: recipe),
      ),
    );

    expect(find.textContaining('A very long recipe title'), findsOneWidget);
  });
}

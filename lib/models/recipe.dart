class Recipe {
  final int id;
  final String title;
  final String? image;
  final List<String>? analyzedInstructions;
  final List<String>? ingredients;
  final String? summary;
  bool isFavourite = false;

  Recipe({
    required this.id,
    required this.title,
    this.image,
    this.analyzedInstructions,
    this.ingredients,
    this.summary,
  });

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'ingredients': ingredients,
      'instructions': analyzedInstructions,
      'isFavourite': isFavourite,
    };
  }
  

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      image: json['image'],
      analyzedInstructions: json['analyzedInstructions'] != null
          ? (json['analyzedInstructions'] as List)
            .expand((instruction) => (instruction['steps'] as List)
            .map((step) => '${step['number']}. ${step['step']}'))
              .toList()
          : null,
      summary: json['summary'],
      ingredients: json['extendedIngredients'] != null
          ? (json['extendedIngredients'] as List)
              .map((i) => i['original'] as String)
              .toList()
          : null,
    );
  }
}

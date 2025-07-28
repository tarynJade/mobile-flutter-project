class Recipe {
  final int id;
  final String title;
  final String? image;
  final String? instructions;
  final List<String>? ingredients;
  final String? summary;
  bool isFavorite = false;

  Recipe({
    required this.id,
    required this.title,
    this.image,
    this.instructions,
    this.ingredients,
    this.summary,
  });

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'ingredients': ingredients,
      'instructions': instructions,
      'isFavorite': isFavorite,
    };
  }
  

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      image: json['image'],
      instructions: json['instructions'],
      summary: json['summary'],
      ingredients: json['extendedIngredients'] != null
          ? (json['extendedIngredients'] as List)
              .map((i) => i['original'] as String)
              .toList()
          : null,
    );
  }
}

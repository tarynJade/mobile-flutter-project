import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe.dart';

class FavouritesManager {
  static final FavouritesManager _instance = FavouritesManager._internal();
  factory FavouritesManager() => _instance;
  FavouritesManager._internal();

  static const String _storageKey = 'favorite_recipes';
  final List<Recipe> _favorites = [];
  
  Future<List<Recipe>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList(_storageKey) ?? [];
    
    _favorites.clear();
    for (final json in favoritesJson) {
        final Map<String, dynamic> recipeMap = jsonDecode(json);
        final recipe = Recipe.fromJson(recipeMap);
        recipe.isFavorite = true;
        _favorites.add(recipe);
      }
    return _favorites;
  }
  
  // Save favorites to storage
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList = _favorites
        .map((recipe) => jsonEncode(recipe.toJson()))
        .toList();
    
    await prefs.setStringList(_storageKey, jsonList);
  }
  
  // Add a recipe to favorites
  Future<void> addFavorite(Recipe recipe) async {
    // Check if recipe is already in favorites
    if (!isRecipeFavorite(recipe.id)) {
      recipe.isFavorite = true;
      _favorites.add(recipe);
      await _saveFavorites();
    }
  }
  
  // Remove a recipe from favorites
  Future<void> removeFavorite(recipeId) async {
    _favorites.removeWhere((recipe) => recipe.id == recipeId);
    await _saveFavorites();
  }
  
  // Check if a recipe is in favorites
  bool isRecipeFavorite(recipeId) {
    return _favorites.any((recipe) => recipe.id == recipeId);
  }
  
 
  List<Recipe> getAllFavorites() {
    return List.from(_favorites);
  }
}
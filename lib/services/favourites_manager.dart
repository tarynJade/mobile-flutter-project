import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe.dart';

class FavouritesManager {
  static final FavouritesManager _instance = FavouritesManager._internal();
  factory FavouritesManager() => _instance;
  FavouritesManager._internal();

  static const String _storageKey = 'favorite_recipes';
  final List<Recipe> _favourites = [];
  
  Future<List<Recipe>> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final favouritesJson = prefs.getStringList(_storageKey) ?? [];
    
    _favourites.clear();
    for (final json in favouritesJson) {
        final Map<String, dynamic> recipeMap = jsonDecode(json);
        final recipe = Recipe.fromJson(recipeMap);
        recipe.isFavourite = true;
        _favourites.add(recipe);
      }
    return _favourites;
  }


  Future<void> _saveFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList = _favourites
        .map((recipe) => jsonEncode(recipe.toJson()))
        .toList();
    
    await prefs.setStringList(_storageKey, jsonList);
  }

  Future<void> addFavourite(Recipe recipe) async {
    recipe.isFavourite = true;
    _favourites.add(recipe);
    await _saveFavourites();
  }
  

  Future<void> removeFavourite(recipeId) async {
    _favourites.removeWhere((recipe) => recipe.id == recipeId);
    await _saveFavourites();
  }
  

  bool isRecipeFavourite(recipeId) {
    return _favourites.any((recipe) => recipe.id == recipeId);
  }


  List<Recipe> getAllFavourites() {
    return List.from(_favourites);
  }
}
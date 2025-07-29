
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/recipe.dart';

class ApiService {
  static const String _apiKey = 'a803c91e1fab4318a217e940a57db557';
  static const String _baseUrl = 'https://api.spoonacular.com/recipes/complexSearch';

  Future<List<Recipe>> fetchRecipes(String query) async {
  final url = Uri.parse('$_baseUrl?query=$query&apiKey=$_apiKey');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final results = data['results'] as List;

    return results.map((json) => Recipe.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load recipes');
  }
}

Future<Recipe> fetchRecipeDetails(int recipeId) async {
  final url = Uri.parse('https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$_apiKey');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return Recipe.fromJson(data);
  } else {
    throw Exception('Failed to load recipe details');
  }
}
}
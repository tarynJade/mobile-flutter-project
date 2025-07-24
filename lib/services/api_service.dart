
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String _apiKey = 'a803c91e1fab4318a217e940a57db557';
  static const String _baseUrl = 'https://api.spoonacular.com/recipes/complexSearch';

  Future<List<dynamic>> fetchRecipes(String query) async {
    final url = Uri.parse('$_baseUrl?query=$query&apiKey=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'] ?? [];
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
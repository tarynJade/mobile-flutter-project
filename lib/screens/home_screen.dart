import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/logo_banner.dart';
import '../widgets/bottom_nav.dart';
import '../models/recipe.dart';
import '../services/api_service.dart';
import '../widgets/search_results.dart'; 
import '../screens/favourite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final ApiService _apiService = ApiService();

  List<Recipe> _recipes = [];
  bool _isLoading = false;
  bool _hasSearched = false;
  String _errorMessage = '';

  Future<void> _searchRecipes(String query) async {
    setState(() {
      _isLoading = true;
      _hasSearched = true;
      _errorMessage = '';
    });

    try {
      final recipes = await _apiService.fetchRecipes(query);
      setState(() {
        _recipes = recipes;
      });
    } catch (error) {
      _handleSearchError(error.toString(), query);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _handleSearchError(String message, String query) {
    setState(() {
      _errorMessage = message;
      _recipes = [];
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $message'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Try Again',
          onPressed: () => _searchRecipes(query),
        ),
      ),
    );
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          const LogoBanner(),
          CustomSearchBar(
            controller: _controller,
            onSubmitted: _searchRecipes,
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 188, 231, 249),
              child: !_hasSearched
                  ? Center(
                      child: Text(
                        'Type your ingredients and get inspired!',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    )
                  : SearchResultsView(
                      recipes: _recipes,
                      isLoading: _isLoading,
                      hasSearched: _hasSearched,
                      errorMessage: _errorMessage,
                    ),
            ),
          ),
        ],
      ),
    ),
     bottomNavigationBar: AppBottomNavBar(
          currentIndex: 0,
          onTabTapped: (index) {
             if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen()),
              );
            }
          },
        ),
  );
}

}
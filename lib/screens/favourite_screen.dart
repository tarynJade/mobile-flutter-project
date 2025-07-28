import 'package:flutter/material.dart';
import 'package:ada_flutter_project/screens/home_screen.dart';
import '../models/recipe.dart';
import '../services/favourites_manager.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/favourites_grid.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavouritesManager _favoritesManager = FavouritesManager();
  List<Recipe> _favorites = [];
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    await _favoritesManager.loadFavorites();
    setState(() {
      _favorites = _favoritesManager.getAllFavorites();
    });
  }

  void _handleBottomNavTap(int index) {
    if (index == _currentIndex) return;

    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Recipes'),
      ),
      body: _favorites.isEmpty
          ? const Center(child: Text('No favourite recipes yet!'))
          : FavoritesGrid(favorites: _favorites),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTabTapped: _handleBottomNavTap,
      ),
    );
  }
}

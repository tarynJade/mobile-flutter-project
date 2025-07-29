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

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    await _favoritesManager.loadFavourites();
    setState(() {
      _favorites = _favoritesManager.getAllFavourites();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Recipes'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
        backgroundColor: const Color.fromARGB(255, 33, 136, 167),
      
      ),
      body: _favorites.isEmpty
          ? const Center(child: Text('No favourite recipes yet!'))
          : FavoritesGrid(favorites: _favorites),
          backgroundColor: const Color.fromARGB(255, 188, 231, 249),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: 1,
        onTabTapped: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
      ),
    );
  }
}

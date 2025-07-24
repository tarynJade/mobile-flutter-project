import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/search_bar.dart';
import '../widgets/recipe_card.dart';
import '../widgets/logo_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _recipes = [];
  int currentPage = 0;

  void _searchRecipes(String query) async {
    final results = await ApiService().fetchRecipes(query);
    setState(() {
      _recipes = results;
    });
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
            const SizedBox(height: 10),
            Expanded(
                child: GridView.builder(
                  itemCount: _recipes.length > 6 ? 6 : _recipes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return RecipeCard(recipe: _recipes[index]);
                  },
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) => setState(() {
          currentPage = value;
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}

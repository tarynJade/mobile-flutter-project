import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;
  
  const AppBottomNavBar({
    super.key, 
    required this.currentIndex, 
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    final safeIndex = currentIndex < 0 || currentIndex > 1 ? 0 : currentIndex;

    return BottomNavigationBar(
      currentIndex: safeIndex,
      onTap: (index) => onTabTapped(index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites'),
      ],
    );
  }
}
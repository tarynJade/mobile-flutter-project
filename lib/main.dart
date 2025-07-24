import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(WhatsCookingApp());
}

class WhatsCookingApp extends StatelessWidget {
  const WhatsCookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "What's Cooking?",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}


import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Got ingredients? Type them here...',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onSubmitted: (value) {
          if (value.trim().isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please enter an ingredient in the search bar.'),
                duration: Duration(seconds: 2),
              ),
            );
            return;
          }
          onSubmitted(value);
        },
      ),
    );
  }
}
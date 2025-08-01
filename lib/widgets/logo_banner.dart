import 'package:flutter/material.dart';

class LogoBanner extends StatelessWidget {
  const LogoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.30,
        child: Image.asset(
          'assets/whats_cooking_logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

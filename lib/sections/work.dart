import 'package:flutter/material.dart';

class Work extends StatelessWidget {
  static const id = '/work';
  const Work({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFFA2A2A6),
          ),
        ),
      ),
    );
  }
}

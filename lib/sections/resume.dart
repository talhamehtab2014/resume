import 'package:flutter/material.dart';

class Resume extends StatelessWidget {
  static const id = '/resume';
  const Resume({super.key});

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

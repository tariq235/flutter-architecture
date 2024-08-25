import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String username;

  const HeaderWidget({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blueAccent,
      child: Text(
        'Welcome, $username!',
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}

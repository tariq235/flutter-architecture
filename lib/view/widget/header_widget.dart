import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String username;

  const HeaderWidget({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome, $username!',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

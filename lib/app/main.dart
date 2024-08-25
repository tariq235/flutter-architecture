import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/app/routes.dart';
import 'package:sampleflutter/app/theme.dart';
import 'package:sampleflutter/config/environment.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        environmentProvider.overrideWithValue(Environment.dev),
      ],
      child: const MyApp(),
    ),
  );
}

final environmentProvider = Provider<Environment>((ref) {
  return Environment.dev; // or Environment.prod
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: lightTheme,
      initialRoute: Routes.login,
      routes: Routes.routes,
    );
  }
}

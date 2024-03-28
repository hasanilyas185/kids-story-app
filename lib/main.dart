import 'package:flutter/material.dart';
import 'package:kids_story/screens/splash.dart';

void main() {
  runApp(const StorytellingApp());
}

class StorytellingApp extends StatelessWidget {
  const StorytellingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storytelling App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18.0, color: Colors.black),
          titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

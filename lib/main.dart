import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals_recipes/screens/categories.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0XFF95CD41),
    ),
    textTheme: GoogleFonts.latoTextTheme());

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const CategoriesScreen(),
    );
  }
}

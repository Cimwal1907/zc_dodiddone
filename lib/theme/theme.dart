import 'package:flutter/material.dart';

class DoDidDoneThemeData {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9F7BF6), // Primary color
      brightness: Brightness.light,
      primary: const Color(0xFF9F7BF6), // Primary color
      secondary: const Color(0xFF4CEB8B), // Secondary color
      // ... other color scheme properties
    ),
    useMaterial3: true,
  );
}

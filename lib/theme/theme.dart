import 'package:flutter/material.dart';

class DoDidDoneTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9F7BF6), // Primary color
      brightness: Brightness.light,
      primary: const Color(0xFF9F7BF6), // Primary color
      secondary: const Color(0xFF4CE8B8), // Secondary color
    ),
    useMaterial3: true,
    // Add this to style the text buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white),
        ),
      ),
    ),
     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFF9F7BF6), // Primary color
      unselectedItemColor: Color(0xFF4CE8B8) // Unselected icon color
    ),
  );
}

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appMainTheme() {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.black,
        onPrimary: Colors.white,
        secondary: Colors.white,
        onSecondary: Colors.black12,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.black87,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      scaffoldBackgroundColor: const Color.fromARGB(179, 234, 232, 232),
    );
  }
}

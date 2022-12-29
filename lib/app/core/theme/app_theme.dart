import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.white,
      onPrimary: Colors.black,
      background: Colors.white70,
      onBackground: Colors.black54,
      secondary: Colors.lightBlue.shade500,
      onSecondary: Colors.lightBlue.shade900,
      error: const Color.fromARGB(80, 255, 255, 255),
      onError: Colors.red.shade900,
      surface: const Color.fromARGB(80, 255, 255, 255),
      onSurface: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.black,
      onPrimary: Colors.white,
      background: Colors.black87,
      onBackground: Colors.white60,
      secondary: Colors.lightBlue.shade500,
      onSecondary: Colors.lightBlue.shade900,
      error: const Color.fromARGB(40, 255, 255, 255),
      onError: Colors.red.shade900,
      surface: const Color.fromARGB(40, 255, 255, 255),
      onSurface: Colors.white,
    ),
  );
}

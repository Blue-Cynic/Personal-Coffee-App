import 'package:flutter/material.dart';

class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
}

final appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF6F4E37),
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    labelSmall: TextStyle(fontSize: 12, color: Color(0xFF8A6E5C)),
  ),
  cardTheme: const CardThemeData(margin: EdgeInsets.all(AppSpacing.sm)),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
  ),
);
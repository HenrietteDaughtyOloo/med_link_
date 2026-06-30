import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF071816),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF01645B),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF004A43),
    tertiary: Color(0xFF3F4947),
    surface: Color(0xFF071816),
    onSurface: Color(0xFFF4F9F9),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Color(0xFFF4F9F9)),
  ),
  cardTheme: CardThemeData(
    color: const Color(0xFF12302D),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    elevation: 4,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFFF4F9F9),
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color(0xFFE2F5F5),
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Color(0xFFE2F5F5)),
    bodyMedium: TextStyle(fontSize: 14, color: Color(0xFFF8F8FB)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF01645B),
      foregroundColor: const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    ),
  ),
);

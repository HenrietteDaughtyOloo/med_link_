import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF4F9F9),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF01645B),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF004A43),
    tertiary: Color(0xFF3F4947),
    surface: Color(0xFFF4F9F9),
    onSurface: Color(0xFF004A43),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Color(0xFF004A43)),
  ),
  cardTheme: CardThemeData(
    color: const Color(0xFFFFFFFF),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    elevation: 4,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF004A43),
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color(0xFF004A43),
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF3F4947)),
    bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF3F4947)),
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

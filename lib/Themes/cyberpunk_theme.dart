import 'package:flutter/material.dart';

/// 🌆 CYBERPUNK THEME
final ThemeData cyberpunkTheme = ThemeData(
  // Core Color Palette
  primaryColor: Color(0xFF00FFD1), // Neon Cyan
  secondaryHeaderColor: Color(0xFFFF00FF), // Bright Magenta
  scaffoldBackgroundColor: Color(0xFF0A0A1A), // Deep Dark Blue-Black

  // App Bar Theme
  appBarTheme: AppBarTheme(
    color: Color(0xFF00FFD1), // Neon Cyan
    foregroundColor: Color(0xFF0A0A1A), // Dark background for contrast
    titleTextStyle: TextStyle(
      color: Color(0xFF0A0A1A),
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    ),
    iconTheme: IconThemeData(color: Color(0xFF0A0A1A)),
  ),

  // Text Button Theme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Color(0xFF00FFD1)), // Neon Cyan
      backgroundColor: WidgetStateProperty.all(Color(0xFF1A1A3A)), // Dark Background
      overlayColor: WidgetStateProperty.all(Color(0xFF00FFD1).withOpacity(0.2)),
    ),
  ),

  // Card Theme
  cardColor: Color(0xFF1A1A3A), // Dark Card Background
  cardTheme: CardTheme(
    elevation: 5,
    shadowColor: Color(0xFF00FFD1).withOpacity(0.5),
  ),

  // Icon Theme
  iconTheme: IconThemeData(color: Color(0xFF00FFD1)), // Neon Cyan

  // Button Theme
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFFFF00FF), // Bright Magenta
    textTheme: ButtonTextTheme.primary,
  ),

  // Brightness and Color Scheme
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF00FFD1), // Neon Cyan
    secondary: Color(0xFFFF00FF), // Bright Magenta
    background: Color(0xFF0A0A1A),
    surface: Color(0xFF1A1A3A),
  ),

  // Text Theme
  textTheme: TextTheme(
    labelLarge: TextStyle(
      color: Color(0xFF00FFD1), // Neon Cyan
      fontSize: 30,
      letterSpacing: 1.2,
    ),
    titleLarge: TextStyle(
      color: Color(0xFFFF00FF), // Bright Magenta
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    ),
    bodyMedium: TextStyle(
      color: Color(0xFFB0BEC5), // Soft Gray for body text
      fontSize: 16,
    ),
  ),

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Color(0xFF0A0A1A), // Dark background
      backgroundColor: Color(0xFF00FFD1), // Neon Cyan
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      elevation: 5,
      shadowColor: Color(0xFF00FFD1),
    ),
  ),

  // Dropdown Menu Theme
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1A1A3A), // Dark Background
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF00FFD1), width: 2), // Neon Cyan border
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF00FFD1), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFF00FF), width: 3), // Magenta when focused
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textStyle: TextStyle(
      color: Color(0xFF00FFD1), // Neon Cyan
      fontSize: 16,
    ),
  ),
);
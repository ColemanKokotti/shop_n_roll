import 'package:flutter/material.dart';

/// 🚀 HONKAI STAR RAIL THEME
final ThemeData honkaiStarRailTheme = ThemeData(
  // Core Color Palette
  primaryColor: Color(0xFF4A6CFF), // Vibrant Blue (Cosmic Blue)
  secondaryHeaderColor: Color(0xFFAE82FF), // Ethereal Purple
  scaffoldBackgroundColor: Color(0xFF1A1E2C), // Deep Space Dark Blue

  // App Bar Theme
  appBarTheme: AppBarTheme(
    color: Color(0xFF4A6CFF), // Cosmic Blue
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.3,
      fontFamily: 'Futura', // Sleek, futuristic font
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  // Text Button Theme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.white),
      backgroundColor: WidgetStateProperty.all(Color(0xFF4A6CFF)),
      overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.2)),
    ),
  ),

  // Card Theme
  cardColor: Color(0xFF2A3244), // Slightly Lighter Dark Blue
  cardTheme: CardTheme(
    elevation: 8,
    shadowColor: Color(0xFF4A6CFF).withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(
        color: Color(0xFF4A6CFF).withOpacity(0.3),
        width: 1.5,
      ),
    ),
  ),

  // Icon Theme
  iconTheme: IconThemeData(
    color: Color(0xFF4A6CFF), // Cosmic Blue
    size: 24,
  ),

  // Button Theme
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFFAE82FF), // Ethereal Purple
    textTheme: ButtonTextTheme.primary,
  ),

  // Brightness and Color Scheme
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF4A6CFF), // Cosmic Blue
    secondary: Color(0xFFAE82FF), // Ethereal Purple
    background: Color(0xFF1A1E2C),
    surface: Color(0xFF2A3244),
  ),

  // Text Theme
  textTheme: TextTheme(
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.4,
      fontFamily: 'Futura',
    ),
    titleLarge: TextStyle(
      color: Color(0xFFAE82FF), // Ethereal Purple
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.3,
    ),
    bodyMedium: TextStyle(
      color: Colors.white70,
      fontSize: 16,
    ),
  ),

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF4A6CFF), // Cosmic Blue
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        fontFamily: 'Futura',
      ),
      elevation: 6,
      shadowColor: Color(0xFFAE82FF).withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),

  // Dropdown Menu Theme
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF2A3244), // Dark Blue Background
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF4A6CFF), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF4A6CFF), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFAE82FF), width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  ),

  // Additional Theming to capture Honkai Star Rail essence
  dividerTheme: DividerThemeData(
    color: Color(0xFF4A6CFF).withOpacity(0.5), // Cosmic Blue with opacity
    thickness: 2,
  ),
);

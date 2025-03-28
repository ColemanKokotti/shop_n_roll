import 'package:flutter/material.dart';

/// 🔨 GOD OF WAR THEME
final ThemeData godOfWarTheme = ThemeData(
  // Core Color Palette
  primaryColor: Color(0xFF8B0000), // Deep Blood Red
  secondaryHeaderColor: Color(0xFF4A4A4A), // Metallic Gray
  scaffoldBackgroundColor: Color(0xFF1C1C1C), // Dark Charcoal Background

  // App Bar Theme
  appBarTheme: AppBarTheme(
    color: Color(0xFF8B0000), // Deep Blood Red
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
      fontFamily: 'Trajan Pro', // Reminiscent of God of War's typography
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  // Text Button Theme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.white),
      backgroundColor: WidgetStateProperty.all(Color(0xFF8B0000)),
      overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.2)),
    ),
  ),

  // Card Theme
  cardColor: Color(0xFF2C2C2C), // Slightly Lighter Charcoal
  cardTheme: CardTheme(
    elevation: 8,
    shadowColor: Color(0xFF8B0000).withOpacity(0.6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),

  // Icon Theme
  iconTheme: IconThemeData(
    color: Color(0xFF8B0000), // Deep Blood Red
    size: 24,
  ),

  // Button Theme
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF8B0000),
    textTheme: ButtonTextTheme.primary,
  ),

  // Brightness and Color Scheme
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF8B0000), // Deep Blood Red
    secondary: Color(0xFF4A4A4A), // Metallic Gray
    background: Color(0xFF1C1C1C),
    surface: Color(0xFF2C2C2C),
  ),

  // Text Theme
  textTheme: TextTheme(
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
      fontFamily: 'Trajan Pro',
    ),
    titleLarge: TextStyle(
      color: Color(0xFF8B0000), // Deep Blood Red
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
      backgroundColor: Color(0xFF8B0000), // Deep Blood Red
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        fontFamily: 'Trajan Pro',
      ),
      elevation: 6,
      shadowColor: Colors.black,
    ),
  ),

  // Dropdown Menu Theme
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF2C2C2C), // Dark Gray
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF8B0000), width: 2), // Blood Red Border
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF8B0000), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  ),

  // Additional Theming to capture God of War essence
  dividerTheme: DividerThemeData(
    color: Color(0xFF8B0000), // Blood Red Dividers
    thickness: 2,
  ),
);
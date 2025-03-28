import 'package:flutter/material.dart';

/// 🌈 POKEMON THEME
final ThemeData pokemonTheme = ThemeData(
  // Core Color Palette
  primaryColor: Color(0xFFFF0000), // Classic Pokéball Red
  secondaryHeaderColor: Color(0xFFFFDE00), // Pikachu Yellow
  scaffoldBackgroundColor: Color(0xFFF5F5F5), // Light Neutral Background

  // App Bar Theme
  appBarTheme: AppBarTheme(
    color: Color(0xFFFF0000), // Pokéball Red
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.1,
      fontFamily: 'Pokemon', // Custom font to mimic Pokémon style
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  // Text Button Theme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.white),
      backgroundColor: WidgetStateProperty.all(Color(0xFFFF0000)),
      overlayColor: WidgetStateProperty.all(Color(0xFFFFDE00).withOpacity(0.2)),
    ),
  ),

  // Card Theme
  cardColor: Color(0xFFFFFFFF), // Crisp White
  cardTheme: CardTheme(
    elevation: 5,
    shadowColor: Color(0xFFFF0000).withOpacity(0.3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: BorderSide(
        color: Color(0xFFFF0000),
        width: 1.5,
      ),
    ),
  ),

  // Icon Theme
  iconTheme: IconThemeData(
    color: Color(0xFFFF0000), // Pokéball Red
    size: 24,
  ),

  // Button Theme
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFFFF0000),
    textTheme: ButtonTextTheme.primary,
  ),

  // Brightness and Color Scheme
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Color(0xFFFF0000), // Pokéball Red
    secondary: Color(0xFFFFDE00), // Pikachu Yellow
    background: Color(0xFFF5F5F5),
    surface: Colors.white,
  ),

  // Text Theme
  textTheme: TextTheme(
    labelLarge: TextStyle(
      color: Color(0xFF3B4CCA), // Pokémon Blue
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
      fontFamily: 'Pokemon',
    ),
    titleLarge: TextStyle(
      color: Color(0xFFFF0000), // Pokéball Red
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.1,
    ),
    bodyMedium: TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
  ),

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFFFF0000), // Pokéball Red
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.1,
        fontFamily: 'Pokemon',
      ),
      elevation: 6,
      shadowColor: Color(0xFFFFDE00),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),

  // Dropdown Menu Theme
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFF0000), width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFF0000), width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFFDE00), width: 3),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    textStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
  ),

  // Additional Theming to capture Pokémon essence
  dividerTheme: DividerThemeData(
    color: Color(0xFFFF0000), // Pokéball Red Dividers
    thickness: 2,
  ),
);
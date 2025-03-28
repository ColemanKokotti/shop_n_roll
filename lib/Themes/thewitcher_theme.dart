
import 'package:flutter/material.dart';

/// 🐺 THE WITCHER 3 THEME
final ThemeData witcherTheme = ThemeData(
  primaryColor: Color(0xFFB22222), // Blood Red
  secondaryHeaderColor: Colors.blueGrey, // Dark Steel
  scaffoldBackgroundColor: Colors.grey, // Medieval Darkness

  appBarTheme: AppBarTheme(
    color: Color(0xFFB22222),
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.3,
      fontFamily: 'MedievalSharp',
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  cardColor: Colors.blueGrey,
  cardTheme: CardTheme(
    elevation: 6,
    shadowColor: Color(0xFFB22222).withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(
        color: Color(0xFFB22222).withOpacity(0.3),
        width: 1.5,
      ),
    ),
  ),

  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Color(0xFFB22222),
    secondary: Color(0xFFD9D9D9),
    background: Color(0xFF1A1A1A),
    surface: Color(0xFF2F2F2F),
  ),

  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Color(0xFFB22222),
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.3,
      fontFamily: 'MedievalSharp',
    ),
    bodyMedium: TextStyle(
      color: Colors.white70,
      fontSize: 16,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFFB22222),
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        fontFamily: 'MedievalSharp',
      ),
      elevation: 6,
      shadowColor: Color(0xFFD9D9D9).withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);

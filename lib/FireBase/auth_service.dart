import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'firebase_language_preference.dart';
import 'theme_preference_service.dart';
import '../Screens/auth_screen.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final LanguagePreferenceService _languagePreferenceService = LanguagePreferenceService();
  final ThemePreferenceService _themePreferenceService = ThemePreferenceService();

  AuthService(this._firebaseAuth);

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<User?> login(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      print('Errore nel login: $e');
      throw AuthException('Login fallito. Si prega di riprovare.');
    }
  }

  Future<User?> register(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Errore nella registrazione: $e');
      throw AuthException('Registrazione fallita. Si prega di riprovare.');
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      final currentUser = _firebaseAuth.currentUser;

      // Clear language and theme preferences if user is logged in
      if (currentUser != null) {
        await _languagePreferenceService.clearLanguagePreference(currentUser.uid);
        await _themePreferenceService.clearThemePreference(currentUser.uid);
      }

      // Logout
      await _firebaseAuth.signOut();

      // Navigate to AuthScreen
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const AuthScreen()),
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      print('Errore nel logout: $e');
      throw AuthException('Errore durante il logout.');
    }
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}
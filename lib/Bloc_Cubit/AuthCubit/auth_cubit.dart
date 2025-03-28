import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Bloc_Cubit/ThemeCubit/theme_cubit.dart';
import '../../FireBase/account_service.dart';
import '../../FireBase/auth_service.dart';
import '../../FireBase/firebase_language_preference.dart';
import '../../FireBase/theme_preference_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  final AccountService _accountService;
  final ThemeCubit _themeCubit;
  final ThemePreferenceService _themePreferenceService;
  final LanguagePreferenceService _languagePreferenceService = LanguagePreferenceService();
  bool rememberMe = false;

  AuthCubit(this._authService, this._accountService, this._themeCubit, this._themePreferenceService) : super(AuthInitial());

  void setRememberMe(bool value) {
    rememberMe = value;
  }

  Future<void> login(String email, String password, BuildContext context) async {
    try {
      emit(AuthLoading());
      User? user = await _authService.login(email, password);
      if (user != null) {
        String? savedTheme = await _themePreferenceService.getThemePreference(user.uid);
        if (savedTheme != null) {
          _themeCubit.selectTheme(savedTheme);
        }
        String? savedLanguage = await _languagePreferenceService.getLanguagePreference(user.uid);
        if (savedLanguage != null && context.mounted) {
          await context.setLocale(Locale(savedLanguage));
        } else if (context.mounted) {
          await _languagePreferenceService.saveLanguagePreference(user.uid, 'en');
          await context.setLocale(const Locale('en'));
        }
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      rethrow;
    }
  }

  Future<void> register(String email, String password, BuildContext context) async {
    try {
      emit(AuthLoading());
      User? user = await _authService.register(email, password);
      if (user != null && context.mounted) {
        await _accountService.createUserAccount(user.uid);
        await _themePreferenceService.saveThemePreference(user.uid, 'default');
        await _languagePreferenceService.saveLanguagePreference(user.uid, 'en');
        await context.setLocale(const Locale('en'));
        _themeCubit.selectTheme('default');
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      rethrow;
    }
  }

  Future<void> checkAuthStatus(BuildContext context) async {
    try {
      User? currentUser = _authService.getCurrentUser();
      if (currentUser != null) {
        String? savedTheme = await _themePreferenceService.getThemePreference(currentUser.uid);
        if (savedTheme != null) {
          _themeCubit.selectTheme(savedTheme);
        }
        String? savedLanguage = await _languagePreferenceService.getLanguagePreference(currentUser.uid);
        if (savedLanguage != null && context.mounted) {
          await context.setLocale(Locale(savedLanguage));
        } else if (context.mounted) {
          await _languagePreferenceService.saveLanguagePreference(currentUser.uid, 'en');
          await context.setLocale(const Locale('en'));
        }
        emit(AuthAuthenticated(currentUser));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _authService.logout(context);
      _themeCubit.selectTheme('default');
      if (context.mounted) {
        await context.setLocale(const Locale('en'));
      }
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> checkSavedCredentials(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    bool rememberMe = prefs.getBool('rememberMe') ?? false;

    if (rememberMe && email != null && password != null) {
      login(email, password, context);
    }
  }
}
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Bloc_Cubit/ThemeCubit/theme_cubit.dart';
import '../../FireBase/account_service.dart';
import '../../FireBase/auth_service.dart';
import '../../FireBase/theme_preference_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  final AccountService _accountService;
  final ThemeCubit _themeCubit;
  final ThemePreferenceService _themePreferenceService;

  AuthCubit(
      this._authService,
      this._accountService,
      this._themeCubit,
      this._themePreferenceService
      ) : super(AuthInitial()) {
    // No need to manually set default theme as ThemeCubit constructor handles it
  }

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());

      // Perform login
      User? user = await _authService.login(email, password);

      if (user != null) {
        // Try to load the user's saved theme
        String? savedTheme = await _themePreferenceService.getThemePreference(user.uid);

        if (savedTheme != null) {
          // Set the theme for the user
          _themeCubit.selectTheme(savedTheme);
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

  Future<void> register(String email, String password) async {
    try {
      emit(AuthLoading());

      // Perform registration
      User? user = await _authService.register(email, password);

      if (user != null) {
        // Create user account
        await _accountService.createUserAccount(user.uid);

        // Set default theme
        await _themePreferenceService.saveThemePreference(user.uid, 'default');

        // Ensure theme is set to default
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

  Future<void> checkAuthStatus() async {
    try {
      User? currentUser = _authService.getCurrentUser();

      if (currentUser != null) {
        // Try to load the user's saved theme
        String? savedTheme = await _themePreferenceService.getThemePreference(currentUser.uid);

        if (savedTheme != null) {
          // Set the theme for the user
          _themeCubit.selectTheme(savedTheme);
        }

        emit(AuthAuthenticated(currentUser));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
      // Reset to default theme on logout
      _themeCubit.selectTheme('default');
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}

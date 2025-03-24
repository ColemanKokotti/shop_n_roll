import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthLoginState extends AuthState {}

class AuthRegisterState extends AuthState {}

class AuthErrorDialogState extends AuthState {
  final String message;
  AuthErrorDialogState(this.message);
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_n_roll/myapp.dart';
import 'package:shop_n_roll/Bloc_Cubit/AuthCubit/auth_cubit.dart';
import 'package:shop_n_roll/FireBase/auth_service.dart';
import 'package:shop_n_roll/FireBase/account_service.dart';
import 'package:shop_n_roll/Bloc_Cubit/ThemeCubit/theme_cubit.dart';
import 'package:shop_n_roll/FireBase/theme_preference_service.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Create a mock AuthCubit for testing
    final authCubit = AuthCubit(
        AuthService(FirebaseAuth.instance),
        AccountService(),
        ThemeCubit(),
        ThemePreferenceService()
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(authCubit: authCubit));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
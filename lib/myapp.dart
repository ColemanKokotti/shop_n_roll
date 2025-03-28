import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Bloc_Cubit/LanguageCubit/setting_language_cubit.dart';
import 'Bloc_Cubit/ThemeCubit/theme_cubit.dart';
import 'Bloc_Cubit/ThemeCubit/settings_theme_cubit.dart';
import 'Bloc_Cubit/LanguageCubit/language_cubit.dart';
import 'Bloc_Cubit/AuthCubit/auth_cubit.dart';
import 'Screens/splash_screen.dart';
import 'Screens/auth_screen.dart';

class MyApp extends StatefulWidget {
  final AuthCubit authCubit;

  const MyApp({super.key, required this.authCubit});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool _isFirstLaunch = true;

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _resetLaunchCounter();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      _resetLaunchCounter();
    }
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final launchCounter = prefs.getInt('app_launch_counter') ?? 0;
    setState(() {
      _isFirstLaunch = launchCounter == 0;
    });
  }

  Future<void> _resetLaunchCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('app_launch_counter', 0);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => SettingsThemeCubit(),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => SettingsLanguageCubit(),
        ),
        BlocProvider.value(
          value: widget.authCubit,
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, currentTheme) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: "Shop 'n' Roll ",
            theme: currentTheme,
            debugShowCheckedModeBanner: false,
            home: _isFirstLaunch ? const SplashScreen() : const AuthScreen(),
          );
        },
      ),
    );
  }
}
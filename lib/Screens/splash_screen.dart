import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/SplashScreenWidgets/animated_button.dart';
import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _shakeController;
  late Animation<Offset> _shakeAnimation;
  late AnimationController _textController;
  late Animation<double> _textAnimation;

  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();

    _shakeController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _shakeAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 0.1),
    ).chain(CurveTween(curve: Curves.elasticInOut)).animate(_shakeController);

    _textController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _textAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeIn,
    );

    _shakeController.repeat(reverse: true);
    _textController.forward();

    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _showButton = true;
      });
    });
  }

  Future<void> _initializeApp() async {
    // Wait for a short duration to show splash screen
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> _setAppLaunched() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('app_launch_counter', 1);
  }

  @override
  void dispose() {
    _shakeController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _shakeAnimation,
              child: Image.asset(
                'assets/images/splash_screen.png',
                width: 200,
                height: 200,
              ),
            ),
            FadeTransition(
              opacity: _textAnimation,
              child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Shop 'n' Roll",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: [
                            theme.primaryColor,
                            theme.secondaryHeaderColor
                          ],
                        ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 200.0, 50.0)),
                    ),
                  )),
            ),
            if (_showButton)
              AnimatedButton(
                onPressed: () {
                  _setAppLaunched();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthScreen(),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

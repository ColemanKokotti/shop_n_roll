import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/SplashScreenWidgets/animated_button.dart';
import 'auth_screen.dart';
import 'list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _shakeController;
  late Animation<Offset> _shakeAnimation;
  late AnimationController _textController;
  late Animation<double> _textAnimation;

  bool _showButton = false;

  @override
  void initState() {
    super.initState();

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

    _checkStayConnected();
  }

  Future<void> _checkStayConnected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool stayConnectedPreference = prefs.getBool('stayConnected') ?? false;

    if (stayConnectedPreference) {
      await Future.delayed(Duration(seconds: 4));

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ListScreen()),
        );
      }
    }
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
                        colors: [theme.primaryColor, theme.secondaryHeaderColor],
                      ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 50.0)),
                  ),
                )

              ),
            ),
            if (_showButton)
              AnimatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthScreen(),
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
import 'package:flutter/material.dart';
import 'dart:math' as math; // Importazione per funzioni matematiche

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({super.key});

  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5), // Durata dell'animazione aumentata
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut), // Animazione easeInOut
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double rotation = (_animation.value - 0.5) * math.pi * 0.2; // Rotazione aumentata
        double scale = 1 + (_animation.value - 0.5).abs() * 0.5; // Scala variabile
        double offsetX = (_animation.value - 0.5) * 50; // Offset orizzontale aumentato
        double offsetY = (_animation.value - 0.5) * -50; // Offset verticale aumentato
        double opacity = 1 - (_animation.value - 0.5).abs() * 0.8; // Opacità variabile

        return Transform.translate(
          offset: Offset(offsetX, offsetY),
          child: Transform.rotate(
            angle: rotation,
            child: Transform.scale(
              scale: scale,
              child: Opacity(
                opacity: opacity,
                child: Text(
                  "Shop 'n' Roll",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [theme.primaryColor, theme.secondaryHeaderColor],
                      ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 50.0)),
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.white.withOpacity(0.5),
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
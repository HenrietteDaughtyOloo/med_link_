import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;
  late final Timer _transitionTimer;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _pulseAnimation = CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    );

    _transitionTimer = Timer(const Duration(seconds: 8), _navigateToSecureScreen);
  }

  @override
  void dispose() {
    _transitionTimer.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  void _navigateToSecureScreen() {
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, animation, secondaryAnimation) => const OnboardingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 700),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return CustomPaint(
                  painter: _ShimmerBackgroundPainter(_pulseAnimation.value),
                  child: child,
                );
              },
              child: const SizedBox.expand(),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-0.3, -0.2),
                  radius: 1.2,
                  colors: [
                    Colors.white.withAlpha(20),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        final scale = 1 + (_pulseAnimation.value * 0.08);
                        return Transform.scale(
                          scale: scale,
                          child: child,
                        );
                      },
                      child: Container(
                        width: 142,
                        height: 142,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            colors: [Color(0xFF6EE7D8), Color(0xFF064E4A)],
                            center: Alignment(-0.2, -0.2),
                            radius: 0.95,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6EE7D8).withAlpha(62),
                              blurRadius: 32,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 86,
                            height: 86,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withAlpha(36),
                              border: Border.all(
                                color: Colors.white.withAlpha(71),
                                width: 1.6,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.medical_services_rounded,
                                size: 44,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'MedLink',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Secure health management, delivered with calm clarity.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Opacity(
                      opacity: 0.88,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withAlpha(66),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Preparing your secure health space',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShimmerBackgroundPainter extends CustomPainter {
  _ShimmerBackgroundPainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final basePaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF012B2D), Color(0xFF0F5D5A), Color(0xFF103E3D)],
        stops: [0.0, 0.55, 1.0],
      ).createShader(rect);

    canvas.drawRect(rect, basePaint);

    final shimmerPaint = Paint();
    final shimmerCenter = Offset(
      size.width * (0.2 + 0.35 * sin(progress * 2 * pi)),
      size.height * (0.3 + 0.18 * cos(progress * 2 * pi)),
    );

    shimmerPaint.shader = RadialGradient(
      colors: [
        Colors.white.withAlpha(31),
        Colors.white.withAlpha(0),
      ],
      stops: const [0.0, 1.0],
      radius: 0.55,
      center: Alignment.center,
    ).createShader(Rect.fromCircle(center: shimmerCenter, radius: size.width * 0.55));

    canvas.drawCircle(shimmerCenter, size.width * 0.58, shimmerPaint);

    for (var i = 0; i < 3; i++) {
      final phase = progress * 2 * pi + (i * pi / 1.5);
      final glowCenter = Offset(
        size.width * (0.75 + 0.08 * cos(phase)),
        size.height * (0.18 + 0.09 * sin(phase)),
      );
      final glowPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFF7EE8D6).withAlpha(41),
            Colors.transparent,
          ],
          stops: const [0.0, 1.0],
        ).createShader(Rect.fromCircle(center: glowCenter, radius: size.width * 0.28));
      canvas.drawCircle(glowCenter, size.width * 0.28, glowPaint);
    }

    final ripplePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..shader = const LinearGradient(
        colors: [Color(0xFF58D7C5), Colors.transparent],
      ).createShader(rect)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    final rippleRadius = size.width * 0.42 + size.width * 0.04 * sin(progress * 2 * pi);
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.48),
      rippleRadius,
      ripplePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ShimmerBackgroundPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

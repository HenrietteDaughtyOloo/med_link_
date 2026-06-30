import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isLight = theme.brightness == Brightness.light;

    final outerColor = isLight ? Colors.white : Colors.white10;
    final middleColor = isLight ? colors.primary.withAlpha(28) : const Color(0xFF0E2D3B);
    final iconColor = isLight ? colors.primary : const Color(0xFF17D6C7);
    final tagBackground = isLight ? const Color.fromRGBO(255, 255, 255, 0.36) : Colors.white.withAlpha(36);

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: outerColor,
              borderRadius: BorderRadius.circular(42),
              border: Border.all(color: isLight ? const Color.fromRGBO(0, 0, 0, 0.03) : Colors.white12),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.28),
                  blurRadius: 32,
                  offset: Offset(0, 18),
                ),
              ],
            ),
          ),
          Container(
            height: size * 0.85,
            width: size * 0.85,
            decoration: BoxDecoration(
              color: middleColor,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: isLight ? const Color.fromRGBO(0, 0, 0, 0.04) : Colors.white12),
            ),
            child: Center(
              child: Container(
                height: size * 0.52,
                width: size * 0.52,
                decoration: BoxDecoration(
                  color: isLight ? Colors.white : Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Icon(
                    Icons.shield_rounded,
                    color: iconColor,
                    size: size * 0.24 > 64 ? 64 : size * 0.24,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: tagBackground,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: isLight ? const Color.fromRGBO(0, 0, 0, 0.03) : Colors.white24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, size: 18, color: isLight ? colors.primary : Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    'HIPAA COMPLIANT',
                    style: TextStyle(color: isLight ? colors.onPrimary.withValues(alpha: 0.7) : Colors.white70, fontSize: 12, letterSpacing: 1.2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DotBackground extends StatelessWidget {
  const DotBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _DotGridPainter());
  }
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final isLight = WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.light;
    final paint = Paint()..color = (isLight ? Colors.black12 : Colors.white10);
    const spacing = 24.0;
    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x + 4, y + 4), 1.4, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

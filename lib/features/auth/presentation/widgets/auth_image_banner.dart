import 'package:flutter/material.dart';

class AuthImageBanner extends StatelessWidget {
  const AuthImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: isLight ? const Color(0xFFF4F9F9) : const Color(0xFF0F1C20),
        border: Border.all(
          color: isLight ? const Color(0xFFE2F5F5) : const Color(0xFF1D3635),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.photo_library_rounded,
          size: 72,
          color: isLight ? const Color(0xFF004A43) : const Color(0xFF80CBC4),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashHeader extends StatelessWidget {
  const SplashHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    final colors = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'MedLink',
          style: GoogleFonts.manrope(
            color: isLight ? colors.primary : Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isLight ? const Color.fromRGBO(0, 0, 0, 0.04) : Colors.white12,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            'Enterprise',
            style: TextStyle(color: isLight ? Colors.black87 : Colors.white70, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

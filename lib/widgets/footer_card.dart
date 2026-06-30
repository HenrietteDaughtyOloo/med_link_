import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterCard extends StatelessWidget {
  const FooterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    final background = isLight ? const Color(0xFFF8F8FB) : const Color(0xFF12302D);
    final borderColor = isLight ? const Color(0xFFE2F5F5) : const Color.fromRGBO(255, 255, 255, 0.08);

    return SizedBox(
      height: 78,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Icon(Icons.lock, color: theme.colorScheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Enterprise Build v2.4.0 • Infrastructure Locked',
                style: GoogleFonts.manrope(
                  color: isLight ? const Color(0xFF004A43) : Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.1,
                ),
              ),
            ),
            Icon(Icons.lock, color: theme.colorScheme.primary),
          ],
        ),
      ),
    );
  }
}

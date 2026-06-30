import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecureCard extends StatelessWidget {
  const SecureCard({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isLight = theme.brightness == Brightness.light;

    final background = isLight
        ? const Color(0xFFF8F8FB)
        : const Color(0xFF12302D);
    final borderColor = isLight
        ? const Color(0xFFE2F5F5)
        : const Color.fromRGBO(255, 255, 255, 0.08);
    final shadowColor = isLight
        ? const Color.fromRGBO(1, 100, 91, 0.14)
        : const Color.fromRGBO(0, 0, 0, 0.35);
    final buttonBg = colors.primary;
    final buttonText = colors.onPrimary;

    return SizedBox(
      height: 290,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 30,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Secure Health Management',
              style: GoogleFonts.manrope(
                color: isLight ? const Color(0xFF004A43) : Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'End-to-end encrypted clinical workflows and telemedicine excellence.',
              style: GoogleFonts.manrope(
                color: isLight ? const Color(0xFF3F4947) : Colors.white70,
                fontSize: 15,
                height: 1.6,
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 58,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize
                      .min, // Keeps the row tight around the text and icon
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Initialize Secure Session',
                      style: TextStyle(
                        color: buttonText,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ), // Adds a clean gap between text and icon
                    Icon(
                      Icons.arrow_forward,
                      color:
                          buttonText, // Ensures the icon matches your button text color
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

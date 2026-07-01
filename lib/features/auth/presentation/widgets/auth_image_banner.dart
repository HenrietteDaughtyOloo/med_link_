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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              'https://res.cloudinary.com/drt1jptk7/image/upload/v1782898515/login__vib7vd.png',
              fit: BoxFit.contain, 
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    color: isLight ? const Color(0xFF004A43) : const Color(0xFF80CBC4),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.broken_image_rounded,
                  size: 72,
                  color: isLight ? const Color(0xFF004A43) : const Color(0xFF80CBC4),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

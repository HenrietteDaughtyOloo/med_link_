import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.prefixText,
    this.keyboardType,
    this.suffixIcon,
  });

  final String label;
  final String hint;
  final bool obscureText;
  final String? prefixText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isLight = theme.brightness == Brightness.light;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isLight ? const Color(0xFF004A43) : Colors.white70,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: TextStyle(
            color: isLight ? const Color(0xFF004A43) : Colors.white,
          ),
          decoration: InputDecoration(
            prefixText: prefixText,
            prefixStyle: TextStyle(
              color: isLight ? const Color(0xFF004A43) : Colors.white70,
            ),
            suffixIcon: suffixIcon,
            hintText: hint,
            hintStyle: TextStyle(
              color: isLight ? const Color(0xFF8BA8A3) : Colors.white38,
            ),
            filled: true,
            fillColor: isLight
                ? const Color(0xFFFFFFFF)
                : const Color(0xFF0F1C20),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: isLight
                    ? const Color(0xFFE2F5F5)
                    : const Color(0xFF1D3635),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: isLight
                    ? const Color(0xFFE2F5F5)
                    : const Color(0xFF1D3635),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: colors.primary, width: 1.8),
            ),
          ),
        ),
      ],
    );
  }
}

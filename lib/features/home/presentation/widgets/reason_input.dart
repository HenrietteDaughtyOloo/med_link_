import 'package:flutter/material.dart';

class ReasonInput extends StatelessWidget {
  const ReasonInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).brightness == Brightness.light
            ? const Color(0xFFF8FBFB)
            : const Color(0xFF0F3A35),
        hintText:
            'Briefly describe your symptoms or reason for the appointment...',
        hintStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.52)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: const Color(0xFFE2F5F5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: colors.primary),
        ),
      ),
    );
  }
}

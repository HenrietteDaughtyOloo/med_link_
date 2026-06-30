import 'package:flutter/material.dart';

class PinCodeRow extends StatelessWidget {
  const PinCodeRow({super.key, this.length = 4});

  final int length;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    final fillColor = isLight ? const Color(0xFFFFFFFF) : const Color(0xFF0F1C20);
    final borderColor = isLight ? const Color(0xFFE2F5F5) : const Color(0xFF1D3635);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        length,
        (index) => Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 1.4),
          ),
        ),
      ),
    );
  }
}

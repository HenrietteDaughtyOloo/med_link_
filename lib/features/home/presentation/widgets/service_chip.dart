import 'package:flutter/material.dart';

class ServiceChip extends StatelessWidget {
  const ServiceChip({
    super.key,
    required this.label,
    required this.icon,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final bg = selected
        ? colors.primary.withValues(alpha: 0.12)
        : Colors.transparent;
    final border = selected
        ? Border.all(color: colors.primary)
        : Border.all(color: const Color(0xFFE2F5F5));

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
          border: border,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected ? colors.primary : const Color(0xFF3F4947),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: selected ? colors.primary : const Color(0xFF3F4947),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

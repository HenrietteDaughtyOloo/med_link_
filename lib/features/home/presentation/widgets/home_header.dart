import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 54,
          width: 54,
          decoration: BoxDecoration(
            color: isLight ? const Color(0xFFFFFFFF) : const Color(0xFF12302D),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.person, color: colors.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text('MedLink', style: TextStyle(color: colors.primary, fontWeight: FontWeight.w800)),
  const SizedBox(height: 4),
  Row(
    children: [
      Text(
        'Good Morning, ', 
        style: TextStyle(color: isLight ? const Color(0xFF3F4947) : Colors.white70),
      ),
      Icon(
        Icons.waving_hand,
        color: const Color(0xFF01645B), // Gives it a clean, classic golden-yellow tint
        size: 16,
        //Color(0xFF01645B)
      ),
    ],
  ),
],          ),
        ),
        Icon(Icons.notifications, color: isLight ? const Color(0xFF3F4947) : Colors.white70),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isLight = Theme.of(context).brightness == Brightness.light;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: colors.primary,
      unselectedItemColor: isLight ? const Color(0xFF3F4947) : Colors.white70,
      backgroundColor: isLight ? const Color(0xFFF4F9F9) : const Color(0xFF071816),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Schedule'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: 'Pharmacy'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String? imageUrl;
  const Avatar({super.key, this.size = 40, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: isLight
          ? const Color(0xFFEEF7F6)
          : const Color(0xFF12302D),
      child: const Icon(Icons.person, color: Colors.white),
    );
  }
}

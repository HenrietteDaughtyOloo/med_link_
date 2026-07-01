import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const ChatHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: isLight ? const Color(0xFF004A43) : Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(width: 6),
            CircleAvatar(
              radius: 18,
              backgroundColor: isLight
                  ? const Color(0xFFEEF7F6)
                  : const Color(0xFF12302D),
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: isLight ? const Color(0xFF004A43) : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 12,
                      color: isLight ? Colors.green : Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.videocam,
                color: isLight ? const Color(0xFF004A43) : Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: isLight ? const Color(0xFF004A43) : Colors.white,
              ),
            ),
            PopupMenuButton<String>(
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'details', child: Text('Details')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68);
}

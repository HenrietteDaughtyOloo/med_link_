import 'package:flutter/material.dart';

class InviteCard extends StatelessWidget {
  const InviteCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isLight ? const Color(0xFFEFF7F6) : const Color(0xFF0F2B29),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.share, color: Color(0xFF0B8F7F)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Invite friends',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 4),
                Text(
                  'Support your friends in growing and managing their savings.',
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Invite')),
        ],
      ),
    );
  }
}

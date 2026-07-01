import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMine;
  final String time;
  const MessageBubble({
    super.key,
    required this.text,
    this.isMine = false,
    this.time = '',
  });

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final bg = isMine
        ? Theme.of(context).colorScheme.primary
        : (isLight ? Colors.white : const Color(0xFF0F2B29));
    final align = isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = isMine
        ? const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomLeft: Radius.circular(14),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomRight: Radius.circular(14),
          );

    return Column(
      crossAxisAlignment: align,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: radius,
              boxShadow: isLight
                  ? [
                      BoxShadow(
                        color: Colors.black.withAlpha(10),
                        blurRadius: 8,
                      ),
                    ]
                  : null,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isMine
                    ? Theme.of(context).colorScheme.onPrimary
                    : (isLight ? const Color(0xFF23302F) : Colors.white70),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            time,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'widgets/chat_header.dart';
import 'widgets/message_bubble.dart';
import 'widgets/message_composer.dart';

class ChatPage extends StatelessWidget {
  final String name;
  const ChatPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        'text': "I'd recommend a supplement for the next three months.",
        'me': false,
        'time': '09:45 AM',
      },
      {
        'text':
            "That makes sense. I'll pick it up this afternoon. Should I schedule a follow-up test for later?",
        'me': true,
        'time': '09:47 AM',
      },
      {
        'text': 'Sure — I can adjust your prescription and send it.',
        'me': false,
        'time': '09:50 AM',
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFF4F9F9)
          : const Color(0xFF071816),
      body: SafeArea(
        child: Column(
          children: [
            ChatHeader(title: name),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final m = messages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: MessageBubble(
                      text: m['text'] as String,
                      isMine: m['me'] as bool,
                      time: m['time'] as String,
                    ),
                  );
                },
              ),
            ),
            const MessageComposer(),
          ],
        ),
      ),
    );
  }
}

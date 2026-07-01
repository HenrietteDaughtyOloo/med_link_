import 'package:flutter/material.dart';
import 'widgets/message_list_item.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        'name': 'Dr. Sarah Jenkins',
        'message': 'Your lab results look very good. I recommend...',
        'time': '10:24 AM',
        'unread': 2,
        'avatar': null,
      },
      {
        'name': 'Dr. Michael Chen',
        'message': 'Please remember to fast for your blood test.',
        'time': 'Yesterday',
        'unread': 0,
        'avatar': null,
      },
      {
        'name': 'Dr. Elena Rodriguez',
        'message': 'Sure, I can adjust your prescription.',
        'time': 'Tue',
        'unread': 0,
        'avatar': null,
      },
      {
        'name': 'Dr. James Wilson',
        'message': 'How is the recovery going for your knee?',
        'time': 'Oct 24',
        'unread': 0,
        'avatar': null,
      },
      {
        'name': 'MedLink Pharmacy',
        'message': 'Action required: Your prescription is ready to collect.',
        'time': 'Oct 22',
        'unread': 1,
        'avatar': null,
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFF4F9F9)
          : const Color(0xFF071816),
      appBar: AppBar(
        title: const Text('Messages'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final c = chats[index];
          return MessageListItem(
            name: c['name'] as String,
            lastMessage: c['message'] as String,
            time: c['time'] as String,
            unreadCount: c['unread'] as int,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ChatPagePlaceholder(title: c['name'] as String),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: chats.length,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'messages_compose_fab',
        onPressed: () {},
        child: const Icon(Icons.create),
      ),
    );
  }
}

class ChatPagePlaceholder extends StatelessWidget {
  final String title;
  const ChatPagePlaceholder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text('Chat will appear here')),
    );
  }
}

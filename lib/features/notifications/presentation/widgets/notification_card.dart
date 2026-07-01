import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final String time;
  final List<String> actions;
  const NotificationCard({
    super.key,
    required this.title,
    required this.body,
    required this.time,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xFFEFF7F6),
                  child: Icon(
                    Icons.event_note,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(body),
            const SizedBox(height: 10),
            if (actions.isNotEmpty)
              Wrap(
                spacing: 8,
                children: actions
                    .map(
                      (a) => OutlinedButton(onPressed: () {}, child: Text(a)),
                    )
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'widgets/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'APPOINTMENT',
        'body':
            'Your appointment with Dr. Sarah has been confirmed for tomorrow at 10:30 AM.',
        'time': '10m ago',
        'actions': ['View Details', 'Reschedule'],
      },
      {
        'title': 'PAYMENT RECEIVED',
        'body':
            "We've received your payment of \$25.00 for the consultation on May 12th.",
        'time': '2h ago',
        'actions': ['Download Receipt'],
      },
      {
        'title': 'PHARMACY UPDATE',
        'body':
            'Prescription for Paracetamol is ready for pickup at your designated pharmacy.',
        'time': '4h ago',
        'actions': ['Track Order', 'Store Info'],
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ChoiceChip(label: Text('All'), selected: true),
                  SizedBox(width: 12),
                  ChoiceChip(label: Text('Appointments'), selected: false),
                  SizedBox(width: 12),
                  ChoiceChip(label: Text('Billing'), selected: false),
                  SizedBox(width: 12),
                  ChoiceChip(label: Text('Pharmacy'), selected: false),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ...items.map(
              (it) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: NotificationCard(
                  title: it['title'] as String,
                  body: it['body'] as String,
                  time: it['time'] as String,
                  actions: List<String>.from(it['actions'] as List),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

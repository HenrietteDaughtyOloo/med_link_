import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(colors: [colors.primary, colors.primary.withValues(alpha: 0.8)]),
        boxShadow: [BoxShadow(color: colors.primary.withValues(alpha: 0.12), blurRadius: 12, offset: const Offset(0,6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 28, backgroundColor: Colors.white, child: Icon(Icons.person, color: colors.primary)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Dr. Sarah Jenkins', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  Text('General Practitioner', style: TextStyle(color: Colors.white70)),
                ]),
              ),
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.videocam, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12)), child: Row(children: [Icon(Icons.calendar_today, color: Colors.white), const SizedBox(width:8), Text('Today, 24 Oct', style: TextStyle(color: Colors.white))]))),
            const SizedBox(width: 8),
            Expanded(child: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12)), child: Row(children: [Icon(Icons.schedule, color: Colors.white), const SizedBox(width:8), Text('2:00 PM', style: TextStyle(color: Colors.white))]))),
          ]),
          const SizedBox(height: 12),
          SizedBox(height: 44, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: colors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Join Call'))),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SavingsCard extends StatelessWidget {
  const SavingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLight
            ? Color(0xFF0F2B29).withAlpha(15)
            : const Color(0xFF12302D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Text('KES', style: TextStyle(fontSize: 12)),
              const SizedBox(width: 6),
              const Text(
                '0',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const Spacer(),
              Icon(
                Icons.remove_red_eye,
                color: isLight ? Colors.black45 : Colors.white70,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(child: Text('All time savings')),
              Expanded(child: Text('Current savings')),
              Expanded(child: Text('All time group savings')),
            ],
          ),
        ],
      ),
    );
  }
}

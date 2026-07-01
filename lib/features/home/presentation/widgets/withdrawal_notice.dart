import 'package:flutter/material.dart';

class WithdrawalNotice extends StatelessWidget {
  const WithdrawalNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLight ? const Color(0xFFF8F8FB) : const Color(0xFF0F2B29),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          const Icon(Icons.priority_high, size: 42, color: Colors.deepPurple),
          const SizedBox(height: 8),
          Text(
            'Withdrawal notice',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: isLight ? const Color(0xFF23302F) : Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Funds withdrawn will reflect in your account within 48 hours excluding weekends and public holidays',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isLight ? const Color(0xFF3F4947) : Colors.white70,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () {}, child: const Text('Dismiss')),
        ],
      ),
    );
  }
}

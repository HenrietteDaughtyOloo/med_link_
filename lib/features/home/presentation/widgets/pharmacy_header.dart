import 'package:flutter/material.dart';

class PharmacyHeader extends StatelessWidget {
  const PharmacyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: colors.primary,
                child: const Icon(Icons.medical_services, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(
                'MedLink',
                style: TextStyle(
                  color: colors.primary,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  color: isLight ? const Color(0xFF3F4947) : Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Pharmacy',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: isLight ? const Color(0xFF004A43) : Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Get your medications delivered fast and securely.',
            style: TextStyle(
              color: isLight ? const Color(0xFF3F4947) : Colors.white70,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for medicines, vitamins...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: isLight
                  ? const Color(0xFFF8F8FB)
                  : const Color(0xFF052422),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

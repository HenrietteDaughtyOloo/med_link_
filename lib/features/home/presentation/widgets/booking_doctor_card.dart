import 'package:flutter/material.dart';

class BookingDoctorCard extends StatelessWidget {
  const BookingDoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviewCount,
  });

  final String name;
  final String specialty;
  final double rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF12302D),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? const Color(0x1401645B)
                : Colors.black26,
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colors.primary, colors.secondary],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: colors.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  specialty,
                  style: TextStyle(
                    color: colors.onSurface.withValues(alpha: 0.75),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.star, color: colors.primary, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      '$rating',
                      style: TextStyle(
                        color: colors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '($reviewCount Reviews)',
                      style: TextStyle(
                        color: colors.onSurface.withValues(alpha: 0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

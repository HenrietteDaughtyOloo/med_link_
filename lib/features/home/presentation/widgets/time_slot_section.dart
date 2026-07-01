import 'package:flutter/material.dart';

class TimeSlotSection extends StatelessWidget {
  const TimeSlotSection({
    super.key,
    required this.title,
    required this.slots,
    required this.selectedSlot,
    required this.onSlotSelected,
  });

  final String title;
  final List<String> slots;
  final String selectedSlot;
  final ValueChanged<String> onSlotSelected;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: colors.primary, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: slots.map((slot) {
            final selected = slot == selectedSlot;
            return ChoiceChip(
              label: Text(
                slot,
                style: TextStyle(
                  color: selected ? colors.onPrimary : colors.onSurface,
                ),
              ),
              selected: selected,
              onSelected: (_) => onSlotSelected(slot),
              selectedColor: colors.primary,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? const Color(0xFFF8FBFB)
                  : const Color(0xFF0F3A35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            );
          }).toList(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    super.key,
    required this.dates,
    required this.selectedDate,
    required this.onSelected,
  });

  final List<String> dates;
  final String selectedDate;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dates.map((date) {
          final selected = date == selectedDate;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(
                date,
                style: TextStyle(
                  color: selected ? colors.onPrimary : colors.onSurface,
                ),
              ),
              selected: selected,
              onSelected: (_) => onSelected(date),
              selectedColor: colors.primary,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? const Color(0xFFF8FBFB)
                  : const Color(0xFF0F3A35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          );
        }).toList(),
      ),
    );
  }
}

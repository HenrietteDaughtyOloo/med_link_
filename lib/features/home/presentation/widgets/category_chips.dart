import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Pain Relief',
      'Vitamins',
      'Supplements',
      'First Aid',
    ];
    final isLight = Theme.of(context).brightness == Brightness.light;

    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final label = categories[index];
          final selected = index == 0;
          return Container(
            margin: const EdgeInsets.only(left: 0),
            child: ChoiceChip(
              label: Text(
                label,
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : (isLight ? const Color(0xFF004A43) : Colors.white70),
                ),
              ),
              selected: selected,
              backgroundColor: isLight
                  ? const Color(0xFFEFF7F6)
                  : const Color(0xFF0F2B29),
              selectedColor: const Color(0xFF0B8F7F),
              onSelected: (_) {},
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: categories.length,
      ),
    );
  }
}

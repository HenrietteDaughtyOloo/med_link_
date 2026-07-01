import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  const ProductCard({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: isLight ? 4 : 0,
      color: isLight ? Colors.white : const Color(0xFF0F2B29),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFEFF7F6),
                ),
                child: const Center(
                  child: Icon(
                    Icons.medical_services,
                    size: 42,
                    color: Color(0xFF0B8F7F),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white, size: 18),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'title': 'Paracetamol', 'price': 5.99},
      {'title': 'Vitamin C 1000mg', 'price': 12.45},
      {'title': 'Antiseptic Cream', 'price': 8.20},
      {'title': 'Nasal Spray Relief', 'price': 9.95},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        itemCount: products.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.74,
        ),
        itemBuilder: (context, index) {
          final p = products[index];
          return ProductCard(
            title: p['title'] as String,
            price: p['price'] as double,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/pharmacy_header.dart';
import '../widgets/category_chips.dart';
import '../widgets/product_grid.dart';

class PharmacyPage extends StatelessWidget {
  const PharmacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final bg = isLight ? const Color(0xFFF4F9F9) : const Color(0xFF071816);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            PharmacyHeader(),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CategoryChips(),
            ),
            SizedBox(height: 12),
            Expanded(child: ProductGrid()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'pharmacy_cart_fab',
        onPressed: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const CheckoutPage())),
        label: const Text('Cart (3)'),
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

// Simple checkout page placed here to keep navigation local — UI only.
class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: const [
                    ListTile(
                      leading: SizedBox(
                        width: 56,
                        height: 56,
                        child: Placeholder(),
                      ),
                      title: Text('Daily Multivitamins'),
                      subtitle: Text('60 Capsules • Pack of 1'),
                      trailing: Text('\$24.99'),
                    ),
                    Divider(),
                    ListTile(
                      leading: SizedBox(
                        width: 56,
                        height: 56,
                        child: Placeholder(),
                      ),
                      title: Text('Advanced Pain Relief'),
                      subtitle: Text('500mg • 24 Tablets'),
                      trailing: Text('\$12.50'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Delivery Address',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.green),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Home\n42nd Medical Plaza, Apt 5B\nUpper Hill, Nairobi, Kenya',
                      ),
                    ),
                    Text('Change', style: TextStyle(color: Colors.teal)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Payment Method',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('M-Pesa'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Card (Stripe)'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const ListTile(title: Text('Subtotal'), trailing: Text('\$37.49')),
            const ListTile(
              title: Text('Delivery Fee'),
              trailing: Text('\$2.50'),
            ),
            const ListTile(title: Text('Tax (VAT)'), trailing: Text('\$1.20')),
            const Divider(),
            ListTile(
              title: const Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              trailing: Text(
                '\$41.19',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

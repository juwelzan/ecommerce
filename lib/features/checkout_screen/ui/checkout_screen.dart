import 'package:ecommerce/shared/path/paths.dart';

class CheckoutScreen extends StatelessWidget {
  static const String name = '/CheckoutScreen';
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Consumer<CartController>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const Center(child: Text('Your cart is empty'));
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('Order summary'),
              const SizedBox(height: 12),
              ...cart.items.map(
                (line) => ListTile(
                  title: Text(line.product.title ?? 'Product'),
                  subtitle: Text('Quantity: ${line.quantity}'),
                  trailing: Text('${line.total}'),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('Subtotal'),
                trailing: Text('${cart.subtotal}'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Online checkout is not connected to a payment or order API yet.',
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: null,
                icon: const Icon(Icons.lock_outline),
                label: const Text('Place order unavailable'),
              ),
            ],
          );
        },
      ),
    );
  }
}

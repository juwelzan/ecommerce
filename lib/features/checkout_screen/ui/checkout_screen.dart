import 'package:ecommerce/shared/path/paths.dart';

class CheckoutScreen extends StatelessWidget {
  static const String name = '/CheckoutScreen';
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.checkout)),
      body: Consumer<CartController>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(child: Text(context.l10n.emptyCart));
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(context.l10n.orderSummary),
              const SizedBox(height: 12),
              ...cart.items.map(
                (line) => ListTile(
                  title: Text(line.product.title ?? context.l10n.allProducts),
                  subtitle: Text(context.l10n.quantity(line.quantity)),
                  trailing: Text('${line.total}'),
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(context.l10n.subtotal),
                trailing: Text('${cart.subtotal}'),
              ),
              const SizedBox(height: 20),
              Text(context.l10n.checkoutUnavailable),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: null,
                icon: const Icon(Icons.lock_outline),
                label: Text(context.l10n.placeOrderUnavailable),
              ),
            ],
          );
        },
      ),
    );
  }
}

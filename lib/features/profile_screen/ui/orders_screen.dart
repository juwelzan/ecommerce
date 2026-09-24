import 'package:ecommerce/shared/path/paths.dart';

class OrdersScreen extends StatelessWidget {
  static const String name = '/OrdersScreen';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.orders),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 64.r,
              color: Colors.grey,
            ),
            Gap(h: 16.h),
            Text(
              context.l10n.noOrders,
              style: context.textTheme.titleMedium,
            ),
            Gap(h: 8.h),
            Text(
              context.l10n.orderHistory,
              style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            Gap(h: 20.h),
            OutlinedButton(
              onPressed: () => context.read<NavbarController>().nextScreen(0),
              child: Text(context.l10n.startShopping),
            ),
          ],
        ),
      ),
    );
  }
}

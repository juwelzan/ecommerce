import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class CardBottonBox extends StatelessWidget {
  const CardBottonBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 150.h,
      decoration: BoxDecoration(
        color: context.theme.secondaryHeaderColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: context.isThemeMod == Brightness.dark
                ? Colors.white38
                : Colors.black12,
          ),
        ],
      ),
      child: Consumer<CartController>(
        builder: (context, cart, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Subtotal'),
                Text('${cart.subtotal}', style: context.textTheme.titleLarge),
              ],
            ),
            SizedBox(
              width: 145.w,
              child: FilledButton.icon(
                onPressed: cart.items.isEmpty
                    ? null
                    : () => context.push(CheckoutScreen.name),
                icon: const Icon(Icons.lock_outline),
                label: const Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/shared/path/paths.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Wishlist',
          style: context.textTheme.headlineLarge?.copyWith(
            fontSize: 20.f,
          ),
        ),
      ),
      body: Consumer<WishlistController>(
        builder: (context, state, child) {
          if (state.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('আপনার Wishlist এখনো খালি।'),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () =>
                        context.read<NavbarController>().nextScreen(0),
                    child: const Text('Continue shopping'),
                  ),
                ],
              ),
            );
          }
          return GridView.builder(
            padding: EdgeInsets.only(
              top: 10.h,
              bottom: 120.h,
              left: 10.w,
              right: 10.w,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: .72,
            ),
            itemCount: state.items.length,
            itemBuilder: (context, index) =>
                ProdactWidget(product: state.items[index]),
          );
        },
      ),
    );
  }
}

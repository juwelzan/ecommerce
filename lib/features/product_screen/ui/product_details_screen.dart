import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String name = '/ProductDetailsScreen';
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final price = product.currentprice ?? product.regularprice ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.productDetails),
        actions: [
          Consumer<WishlistController>(
            builder: (context, wishlist, child) => IconButton(
              tooltip: context.l10n.wishlist,
              onPressed: () => wishlist.toggle(product),
              icon: Icon(
                wishlist.contains(product)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 280,
            child: product.photo == null
                ? Image.asset(Asset.navbCart)
                : CachedNetworkImage(
                    imageUrl: product.photo!,
                    fit: BoxFit.contain,
                    errorWidget: (context, url, error) =>
                        Image.asset(Asset.navbCart),
                  ),
          ),
          const SizedBox(height: 16),
          Text(
            product.title ?? context.l10n.allProducts,
            style: context.textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text('\$$price', style: context.textTheme.headlineSmall),
          if (product.categoryTitle != null) ...[
            const SizedBox(height: 8),
            Text('${context.l10n.category}: ${product.categoryTitle}'),
          ],
          const SizedBox(height: 8),
          Text(
            product.quantity == 0
                ? context.l10n.noProducts
                : product.quantity == null
                    ? context.l10n.available
                    : context.l10n.quantity(product.quantity!),
          ),
          if (product.brand != null) ...[
            const SizedBox(height: 8),
            Text('${context.l10n.brand}: ${product.brand}'),
          ],
          if (product.description != null) ...[
            const SizedBox(height: 16),
            Text(product.description!),
          ],
          const SizedBox(height: 24),
          Consumer<CartController>(
            builder: (context, cart, child) {
              final line = cart.items.where(
                (item) => item.product.id == product.id,
              );
              final quantity = line.isEmpty ? 0 : line.first.quantity;
              return FilledButton.icon(
                onPressed: () {
                  final added = cart.add(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        added
                            ? context.l10n.addToCart
                            : context.localizedError(
                                cart.errorMessage,
                                'noProducts',
                              ),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: Text(
                  quantity == 0
                      ? context.l10n.addToCart
                      : '${context.l10n.addToCart}  |  $quantity',
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {
              context.pop();
              context.read<NavbarController>().nextScreen(2);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
            label: Text(context.l10n.viewCart),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce/shared/network_data/get_product_data.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class CategoryProductsScreen extends StatelessWidget {
  static const String name = '/CategoryProductsScreen';
  final CategoryModel category;

  const CategoryProductsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = getIt<GetProductData>();
    return Scaffold(
      appBar: AppBar(title: Text(category.title ?? context.l10n.allProducts)),
      body: AnimatedBuilder(
        animation: products,
        builder: (context, child) {
          if (products.isLoding && products.product.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (products.errorMessage != null && products.product.isEmpty) {
            return _MessageState(
              message: context.localizedError(
                products.errorMessage,
                'loadProductsError',
              ),
              action: products.getProduct,
              actionLabel: context.l10n.retry,
            );
          }
          final items = products.byCategory(
            category.id ?? category.slug ?? category.title,
          );
          if (items.isEmpty) {
            return _MessageState(message: context.l10n.noProducts);
          }
          return RefreshIndicator(
            onRefresh: products.getProduct,
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: .72,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  ProdactWidget(product: items[index]),
            ),
          );
        },
      ),
    );
  }
}

class _MessageState extends StatelessWidget {
  final String message;
  final Future<void> Function()? action;
  final String actionLabel;

  const _MessageState({
    required this.message,
    this.action,
    this.actionLabel = '',
  });

  @override
  Widget build(BuildContext context) {
    final label = actionLabel.isEmpty ? context.l10n.continueShopping : actionLabel;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, textAlign: TextAlign.center),
          if (action != null) ...[
            const SizedBox(height: 12),
            OutlinedButton(onPressed: action, child: Text(label)),
          ] else
            TextButton(
              onPressed: () => context.pop(),
              child: Text(label),
            ),
        ],
      ),
    );
  }
}

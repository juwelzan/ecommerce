import 'package:ecommerce/shared/network_data/get_product_data.dart';
import 'package:ecommerce/shared/path/paths.dart';

class ProductListingScreen extends StatelessWidget {
  static const String name = '/ProductListingScreen';
  final String title;

  const ProductListingScreen({super.key, this.title = 'All Products'});

  @override
  Widget build(BuildContext context) {
    final products = getIt<GetProductData>();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: AnimatedBuilder(
        animation: products,
        builder: (context, child) {
          if (products.isLoding && products.product.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (products.errorMessage != null && products.product.isEmpty) {
            return Center(
              child: OutlinedButton(
                onPressed: products.getProduct,
                child: const Text('Retry'),
              ),
            );
          }
          if (products.product.isEmpty) {
            return const Center(child: Text('কোনো পণ্য পাওয়া যায়নি।'));
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
              itemCount: products.product.length,
              itemBuilder: (context, index) =>
                  ProdactWidget(product: products.product[index]),
            ),
          );
        },
      ),
    );
  }
}

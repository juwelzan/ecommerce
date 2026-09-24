import 'package:ecommerce/shared/network_data/get_product_data.dart';
import 'package:ecommerce/shared/path/paths.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = getIt<GetProductData>();
    return AnimatedBuilder(
      animation: products,
      builder: (context, child) {
        if (products.isLoding && products.product.isEmpty) {
          return SizedBox(
            height: 180,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (products.product.isEmpty) {
          return SizedBox(
            height: 180,
            child: Center(child: Text(context.l10n.noProducts)),
          );
        }
        return SizedBox(
          height: 180.h,
          child: ListView.builder(
            itemCount: products.product.length,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 20.w),
                child: RepaintBoundary(
                  child: ProdactWidget(product: products.product[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

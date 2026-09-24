import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/themes/app_colors.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class ProdactWidget extends StatelessWidget {
  final ProductModel? product;
  const ProdactWidget({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (product != null) {
          context.push(ProductDetailsScreen.name, extra: product);
        }
      },
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
          color: context.theme.secondaryHeaderColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              // offset: Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: product?.photo == null
                  ? Image.asset(Asset.navbCart, height: 70.h)
                  : CachedNetworkImage(
                      imageUrl: product!.photo!,
                      height: 70.h,
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) =>
                          Image.asset(Asset.navbCart, height: 70.h),
                    ),
            ),
            Gap(h: 10.h),
            Expanded(
              child: RepaintBoundary(
                child: Container(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.r),
                      bottomRight: Radius.circular(12.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        product?.title ?? context.l10n.allProducts,
                        style: context.textTheme.titleLarge?.copyWith(
                          fontSize: 12.f,
                          fontWeight: .w500,
                          color: AppColors.lightText,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "\$${product?.currentprice ?? product?.regularprice ?? 0}",
                              style: context.textTheme.titleMedium?.copyWith(
                                fontSize: 11.f,
                                color: AppColors.lightText,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Image.asset(Asset.starPNG, width: 13.w),
                          SizedBox(width: 3.w),
                          Text(
                            "4.5",
                            style: context.textTheme.titleMedium?.copyWith(
                              fontSize: 11.f,
                              color: AppColors.lightText,
                            ),
                          ),
                          IconButton(
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            onPressed: product == null
                                ? null
                                : () {
                                    final cart = context.read<CartController>();
                                    final added = cart.add(product!);
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
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  },
                            icon: Consumer<CartController>(
                              builder: (context, cart, child) => Icon(
                                cart.quantityFor(product ?? ProductModel()) > 0
                                    ? Icons.check_circle_outline
                                    : Icons.add_shopping_cart,
                                size: 18,
                              ),
                            ),
                          ),
                          IconButton(
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            onPressed: product == null
                                ? null
                                : () => context
                                      .read<WishlistController>()
                                      .toggle(product!),
                            icon: Consumer<WishlistController>(
                              builder: (context, wishlist, child) => Icon(
                                wishlist.contains(product ?? ProductModel())
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 18,
                                color: context.theme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

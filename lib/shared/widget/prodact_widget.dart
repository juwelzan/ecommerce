import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class ProdactWidget extends StatelessWidget {
  final ProductModel? product;
  const ProdactWidget({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final isInStock = product?.quantity == null || product!.quantity! > 0;
    final price = product?.currentprice ?? product?.regularprice ?? 0;

    return GestureDetector(
      onTap: () {
        if (product != null) {
          context.push(ProductDetailsScreen.name, extra: product);
        }
      },
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: context.isThemeMod == Brightness.light
                ? Colors.grey.shade200
                : Colors.grey.shade800,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Image area ───
            Expanded(
              child: RepaintBoundary(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.theme.secondaryHeaderColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12.r),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: product?.photo == null
                            ? Padding(
                                padding: EdgeInsets.all(12.r),
                                child: Icon(
                                  Icons.image_outlined,
                                  size: 32.r,
                                  color: context.theme.primaryColor
                                      .withValues(alpha: 0.4),
                                ),
                              )
                            : CachedNetworkImage(
                                imageUrl: product!.photo!,
                                fit: BoxFit.contain,
                                placeholder: (context, url) => SizedBox(
                                  width: 20.w,
                                  height: 20.w,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Padding(
                                      padding: EdgeInsets.all(12.r),
                                      child: Icon(
                                        Icons.broken_image_outlined,
                                        size: 32.r,
                                        color: context.theme.primaryColor
                                            .withValues(alpha: 0.4),
                                      ),
                                    ),
                              ),
                      ),
                      // Wishlist — top right
                      Positioned(
                        top: 4.h,
                        right: 4.w,
                        child: _WishlistButton(product: product),
                      ),
                      // Out of stock overlay
                      if (!isInStock)
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12.r),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                context.l10n.outOfStock,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.f,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            // ─── Text content area ───
            RepaintBoundary(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.w, 6.h, 8.w, 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Product name
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      product?.title ?? context.l10n.allProducts,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontSize: 12.f,
                        height: 1.25,
                      ),
                    ),
                    Gap(h: 4.h),
                    // Rating
                    Row(
                      children: [
                        Icon(Icons.star_rounded,
                            size: 12.r, color: Colors.amber),
                        Gap(w: 2.w),
                        Text(
                          product?.rating?.toStringAsFixed(1) ?? '4.5',
                          style: context.textTheme.labelSmall?.copyWith(
                            fontSize: 10.f,
                          ),
                        ),
                      ],
                    ),
                    Gap(h: 6.h),
                    // Price + Add to cart
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '৳',
                                style: context.textTheme.titleSmall?.copyWith(
                                  fontSize: 10.f,
                                  color: context.theme.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Gap(w: 1.w),
                              Flexible(
                                child: Text(
                                  '$price',
                                  style:
                                      context.textTheme.titleLarge?.copyWith(
                                    fontSize: 14.f,
                                    color: context.theme.primaryColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _AddToCartButton(product: product),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  final ProductModel? product;
  const _AddToCartButton({this.product});

  @override
  Widget build(BuildContext context) {
    final primary = context.theme.primaryColor;
    return Consumer<CartController>(
      builder: (context, cart, child) {
        final quantity = cart.quantityFor(product ?? ProductModel());
        final isInCart = quantity > 0;
        final outOfStock =
            product?.quantity != null && product!.quantity! == 0;

        return InkWell(
          onTap: (product == null || outOfStock)
              ? null
              : () {
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
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: isInCart
                  ? primary
                  : primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isInCart ? Icons.check : Icons.add,
                  size: 14.r,
                  color: isInCart ? Colors.white : primary,
                ),
                if (isInCart) ...[
                  Gap(w: 3.w),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      fontSize: 11.f,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _WishlistButton extends StatelessWidget {
  final ProductModel? product;
  const _WishlistButton({this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<WishlistController>(
      builder: (context, wishlist, child) {
        final isFav = wishlist.contains(product ?? ProductModel());
        return InkWell(
          onTap: product == null
              ? null
              : () => context.read<WishlistController>().toggle(product!),
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: context.theme.cardColor.withValues(alpha: 0.8),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              size: 14.r,
              color: isFav ? Colors.redAccent : context.theme.primaryColor,
            ),
          ),
        );
      },
    );
  }
}

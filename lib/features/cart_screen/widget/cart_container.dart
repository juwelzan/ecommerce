import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class CartContainer extends StatelessWidget {
  final CartLine line;
  const CartContainer({super.key, required this.line});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(ProductDetailsScreen.name, extra: line.product),
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.all(10.r),
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: context.isThemeMod == Brightness.light
                  ? Colors.black12
                  : Colors.white12,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              height: 80.w,
              width: 80.w,
              child: line.product.photo == null
                  ? Image.asset(Asset.jpegAppleWhite)
                  : CachedNetworkImage(
                      imageUrl: line.product.photo!,
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) =>
                          Image.asset(Asset.jpegAppleWhite),
                    ),
            ),
            Gap(w: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          line.product.title ?? context.l10n.productFallback,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        onPressed: () =>
                            context.read<CartController>().remove(line),
                        icon: const Icon(Icons.delete_outline, size: 20),
                      ),
                    ],
                  ),
                  Gap(h: 4.h),
                  Text(
                    context.l10n.quantityLabel(line.quantity),
                    style: context.textTheme.bodySmall,
                  ),
                  Gap(h: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Asset.svgTaka, width: 13),
                          Gap(w: 2.w),
                          Text(
                            '${line.total}',
                            style: context.textTheme.titleLarge?.copyWith(
                              color: context.theme.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            onPressed: () =>
                                context.read<CartController>().decrease(line),
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              '${line.quantity}',
                              style: context.textTheme.titleMedium,
                            ),
                          ),
                          IconButton(
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            onPressed: () =>
                                context.read<CartController>().increase(line),
                            icon: const Icon(
                              Icons.add_circle_outline,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

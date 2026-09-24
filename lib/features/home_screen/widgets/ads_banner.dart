import 'package:ecommerce/features/home_screen/data/ads_danner_data.dart';
import 'package:ecommerce/shared/network_data/get_categories_data.dart';
import 'package:ecommerce/shared/network_data/get_product_data.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class AdsBanner extends StatelessWidget {
  const AdsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    if (AdsBannerData.bannerImge.isEmpty) {
      return Container(
        height: 150.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: Text(
            'Promotions will appear here',
            style: context.textTheme.bodyMedium,
          ),
        ),
      );
    }
    return Column(
      children: [
        SizedBox(
          height: 150.h,
          width: double.infinity,
          child: PageView.builder(
            physics: const ClampingScrollPhysics(),
            controller: context.read<AdsBannerProvider>().pageController,
            itemCount: 1000000,
            onPageChanged: (value) =>
                context.read<AdsBannerProvider>().update(value),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: GestureDetector(
                  onTap: () => _openBannerDestination(context, index),
                  child: AdsBannerData
                      .bannerImge[index % AdsBannerData.bannerData.length],
                ),
              );
            },
          ),
        ),
        Gap(h: 5.h),
        SizedBox(
          height: 15.h,
          child: Consumer<AdsBannerProvider>(
            builder: (context, state, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(AdsBannerData.bannerData.length, (
                  index,
                ) {
                  bool isActiv = index == state.index;

                  return AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    padding: EdgeInsets.all(2),
                    width: isActiv ? 28.w : 12.w,
                    height: 11.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: isActiv ? 0 : 2,
                        color: isActiv
                            ? context.theme.primaryColor
                            : Colors.grey,
                      ),

                      color: isActiv
                          ? context.theme.primaryColor
                          : Colors.transparent,
                    ),
                    child: isActiv
                        ? Row(
                            mainAxisAlignment: .start,
                            children: [
                              TweenAnimationBuilder(
                                tween: Tween<double>(begin: 0, end: 24.w),
                                duration: Duration(milliseconds: 5100),
                                builder: (context, value, child) {
                                  return Container(
                                    height: 10.h,
                                    width: value,
                                    decoration: BoxDecoration(
                                      color: Color(0xfffafafa),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  );
                                },
                              ),
                            ],
                          )
                        : null,
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}

void _openBannerDestination(BuildContext context, int index) {
  final banner =
      AdsBannerData.bannerData[index % AdsBannerData.bannerData.length];
  final productId = banner.product;
  if (productId != null) {
    final product = getIt<GetProductData>().product.firstWhereOrNull(
      (item) => item.id == productId || item.slug == productId,
    );
    if (product != null) {
      context.push(ProductDetailsScreen.name, extra: product);
      return;
    }
  }
  final categoryId = banner.category;
  if (categoryId != null) {
    final category = getIt<GetCategoriesData>().allCategory.firstWhereOrNull(
      (item) => item.id == categoryId || item.slug == categoryId,
    );
    if (category != null) {
      context.push(CategoryProductsScreen.name, extra: category);
    }
  }
}

extension _FirstWhereOrNull<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T item) test) {
    for (final item in this) {
      if (test(item)) return item;
    }
    return null;
  }
}

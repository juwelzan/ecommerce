import 'package:ecommerce/shared/path/paths.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarController>(
      builder: (context, state, child) {
        final l10n = context.l10n;
        return Container(
          height: 60.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(25.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Container(
            height: 60.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: context.isThemeMod == Brightness.light
                  ? Colors.deepPurple.withValues(alpha: 0.08)
                  : Colors.deepPurple.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navBarIcon(
                  context,
                  img: Asset.navbHome,
                  isActive: state.pageIndex == 0,
                  screenIndex: 0,
                  label: l10n.home,
                ),
                navBarIcon(
                  context,
                  img: Asset.navbCategory,
                  isActive: state.pageIndex == 1,
                  screenIndex: 1,
                  label: l10n.categories,
                ),
                navBarIcon(
                  context,
                  img: Asset.navbCart,
                  isActive: state.pageIndex == 2,
                  screenIndex: 2,
                  label: l10n.cart,
                ),
                navBarIcon(
                  context,
                  img: Asset.navbWish,
                  isActive: state.pageIndex == 3,
                  screenIndex: 3,
                  label: l10n.wishlist,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget navBarIcon(
  BuildContext context, {
  required bool isActive,
  required String img,
  required int screenIndex,
  required String label,
}) {
  final icon = Image.asset(
    img,
    height: 30.h,
    color: isActive
        ? context.theme.primaryColor
        : context.theme.primaryColorLight,
  );
  return Tooltip(
    message: label,
    child: InkWell(
      onTap: () => context.read<NavbarController>().nextScreen(screenIndex),
      borderRadius: BorderRadius.circular(20.r),
      child: Padding(
      padding: EdgeInsets.all(6.r),
      child: screenIndex == 2
          ? Consumer<CartController>(
              builder: (context, cart, child) => Stack(
                clipBehavior: Clip.none,
                children: [
                  icon,
                  if (cart.itemCount > 0)
                    Positioned(
                      top: -4,
                      right: -6,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${cart.itemCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          : icon,
      ),
    ),
  );
}

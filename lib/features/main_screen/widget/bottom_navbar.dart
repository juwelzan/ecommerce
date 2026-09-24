import 'package:ecommerce/shared/path/paths.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarController>(
      builder: (context, state, child) {
        final l10n = context.l10n;
        final primary = context.theme.primaryColor;
        final inactive = context.isThemeMod == Brightness.light
            ? Colors.grey.shade600
            : Colors.grey.shade400;

        return Container(
          height: 68.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: primary.withValues(
                alpha: context.isThemeMod == Brightness.light ? 0.06 : 0.18,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home_rounded,
                  label: l10n.home,
                  isActive: state.pageIndex == 0,
                  screenIndex: 0,
                  activeColor: primary,
                  inactiveColor: inactive,
                ),
                _NavItem(
                  icon: Icons.grid_view_outlined,
                  activeIcon: Icons.grid_view_rounded,
                  label: l10n.categories,
                  isActive: state.pageIndex == 1,
                  screenIndex: 1,
                  activeColor: primary,
                  inactiveColor: inactive,
                ),
                _NavItem(
                  icon: Icons.shopping_cart_outlined,
                  activeIcon: Icons.shopping_cart_rounded,
                  label: l10n.cart,
                  isActive: state.pageIndex == 2,
                  screenIndex: 2,
                  activeColor: primary,
                  inactiveColor: inactive,
                  showCartBadge: true,
                ),
                _NavItem(
                  icon: Icons.favorite_border_rounded,
                  activeIcon: Icons.favorite_rounded,
                  label: l10n.wishlist,
                  isActive: state.pageIndex == 3,
                  screenIndex: 3,
                  activeColor: primary,
                  inactiveColor: inactive,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.screenIndex,
    required this.activeColor,
    required this.inactiveColor,
    this.showCartBadge = false,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final int screenIndex;
  final Color activeColor;
  final Color inactiveColor;
  final bool showCartBadge;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? activeColor : inactiveColor;
    final iconWidget = Icon(
      isActive ? activeIcon : icon,
      size: 24.r,
      color: color,
    );

    return Tooltip(
      message: label,
      child: InkWell(
        onTap: () => context.read<NavbarController>().nextScreen(screenIndex),
        borderRadius: BorderRadius.circular(16.r),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 56.w, minHeight: 48.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showCartBadge)
                  Consumer<CartController>(
                    builder: (context, cart, child) => Badge(
                      isLabelVisible: cart.itemCount > 0,
                      label: Text(
                        '${cart.itemCount}',
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: iconWidget,
                    ),
                  )
                else
                  iconWidget,
                Gap(h: 2.h),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.f,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

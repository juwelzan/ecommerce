import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

/// Sticky cart footer: Total price + Checkout (calculation unchanged).
class CardBottonBox extends StatelessWidget {
  const CardBottonBox({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Material(
      elevation: 8,
      color: context.theme.scaffoldBackgroundColor,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 12.h + bottomInset),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          border: Border(
            top: BorderSide(
              color: context.isThemeMod == Brightness.light
                  ? Colors.grey.shade200
                  : Colors.grey.shade800,
            ),
          ),
        ),
        child: Consumer<CartController>(
          builder: (context, cart, child) {
            final canCheckout = cart.items.isNotEmpty;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      context.l10n.total,
                      style: TextStyle(
                        fontSize: 14.f,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Asset.svgTaka,
                          width: 18.w,
                          height: 18.w,
                          colorFilter: ColorFilter.mode(
                            context.theme.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        Gap(w: 4.w),
                        Text(
                          '${cart.subtotal}',
                          style: TextStyle(
                            fontSize: 20.f,
                            fontWeight: FontWeight.w800,
                            color: context.theme.primaryColor,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(h: 14.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: FilledButton(
                    onPressed: canCheckout
                        ? () => context.push(CheckoutScreen.name)
                        : null,
                    style: FilledButton.styleFrom(
                      backgroundColor: context.theme.primaryColor,
                      disabledBackgroundColor: context.theme.primaryColor
                          .withValues(alpha: 0.35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    child: Text(
                      context.l10n.checkout,
                      style: TextStyle(
                        fontSize: 15.f,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

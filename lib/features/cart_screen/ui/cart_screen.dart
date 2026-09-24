import 'package:ecommerce/shared/path/paths.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<NavbarController>().showNavbar();
        context.read<NavbarController>().back();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 100.w,
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  context.read<NavbarController>().showNavbar();
                  context.read<NavbarController>().nextScreen(0);
                },
                icon: Image.asset(
                  Asset.backPNG,
                  color: context.theme.primaryColorDark,
                  width: 30.w,
                ),
              ),
              Text(
                context.l10n.cart,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontSize: 20.f,
                ),
              ),
            ],
          ),
        ),

        body: Stack(
          children: [
            Positioned.fill(
              child: CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      bottom: 200.h,
                      left: 10.w,
                      right: 10.w,
                    ),
                    sliver: Consumer<CartController>(
                      builder: (context, cart, child) {
                        if (cart.items.isEmpty) {
                          return SliverFillRemaining(
                            child: Center(child: Text(context.l10n.emptyCart)),
                          );
                        }
                        return SliverList.separated(
                          separatorBuilder: (context, index) => Gap(h: 20),
                          itemCount: cart.items.length,
                          itemBuilder: (context, index) => RepaintBoundary(
                            child: CartContainer(line: cart.items[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(bottom: 0, right: 0, left: 0, child: CardBottonBox()),
          ],
        ),
      ),
    );
  }
}

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
        print(result);
        context.read<NavbarController>().nextScreen(0);
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
                  context.read<NavbarController>().nextScreen(0);
                },
                icon: Image.asset(
                  Asset.backPNG,
                  color: context.theme.primaryColorDark,
                  width: 30.w,
                ),
              ),
              Text(
                "Cart",
                style: context.textTheme.headlineLarge?.copyWith(
                  fontSize: 20.w,
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
                    sliver: SliverList.separated(
                      separatorBuilder: (context, index) => Gap(h: 20),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return RepaintBoundary(child: CartContainer());
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

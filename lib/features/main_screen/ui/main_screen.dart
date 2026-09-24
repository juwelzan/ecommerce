import 'package:ecommerce/features/main_screen/widget/bottom_navbar.dart';
import 'package:ecommerce/shared/path/paths.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String name = "/MainScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context) != null) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPushNext() {
    // When navigating to a child/detail screen (e.g., ProductDetailsScreen)
    context.read<NavbarController>().hideNavbar();
  }

  @override
  void didPopNext() {
    // When returning back to MainScreen from a child/detail screen
    context.read<NavbarController>().showNavbar();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Consumer<NavbarController>(
        builder: (context, state, child) {
          final banners = context.read<AdsBannerProvider>();
          if (state.pageIndex == 0) {
            banners.autoScrollBanner();
          } else {
            banners.pauseAutoScroll();
          }
          return Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFAFA),
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple.withValues(alpha: 0.7),
                        Colors.deepPurple.withValues(alpha: 0.4),
                        Colors.deepPurple.withValues(alpha: 0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              Positioned.fill(
                child: IndexedStack(
                  index: state.pageIndex,
                  children: [
                    for (var index = 0; index < state.page.length; index++)
                      TickerMode(
                        enabled: index == state.pageIndex,
                        child: state.page[index],
                      ),
                  ],
                ),
              ),

              Positioned(
                left: 10.w,
                right: 10.w,
                bottom: bottomPadding > 0 ? bottomPadding + 6.h : 18.h,
                child: AnimatedSlide(
                  offset: state.isNavbarVisible
                      ? Offset.zero
                      : const Offset(0.0, 1.8),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: state.isNavbarVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: IgnorePointer(
                      ignoring: !state.isNavbarVisible,
                      child: const BottomNavbar(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

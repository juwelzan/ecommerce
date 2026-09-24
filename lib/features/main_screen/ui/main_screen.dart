import 'package:ecommerce/features/main_screen/widget/bottom_navbar.dart';
import 'package:ecommerce/shared/path/paths.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String name = "/MainScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with RouteAware {
  bool _routeSubscribed = false;
  int? _lastBannerPageIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route != null && !_routeSubscribed) {
      routeObserver.subscribe(this, route);
      _routeSubscribed = true;
    }
  }

  @override
  void dispose() {
    if (_routeSubscribed) {
      routeObserver.unsubscribe(this);
    }
    super.dispose();
  }

  @override
  void didPushNext() {
    // Full-screen child routes (product details, etc.) — hide navbar.
    context.read<NavbarController>().hideNavbar();
  }

  @override
  void didPopNext() {
    // Restore navbar unless Cart tab (index 2) keeps it hidden.
    final nav = context.read<NavbarController>();
    if (nav.pageIndex == 2) {
      nav.hideNavbar();
    } else {
      nav.showNavbar();
    }
  }

  void _syncBannerScroll(NavbarController state) {
    if (_lastBannerPageIndex == state.pageIndex) return;
    _lastBannerPageIndex = state.pageIndex;
    final banners = context.read<AdsBannerProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (state.pageIndex == 0) {
        banners.autoScrollBanner();
      } else {
        banners.pauseAutoScroll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Consumer<NavbarController>(
        builder: (context, state, child) {
          _syncBannerScroll(state);
          return Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    gradient: LinearGradient(
                      colors: [
                        context.theme.primaryColor.withValues(alpha: 0.35),
                        context.theme.primaryColor.withValues(alpha: 0.12),
                        context.theme.primaryColor.withValues(alpha: 0),
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

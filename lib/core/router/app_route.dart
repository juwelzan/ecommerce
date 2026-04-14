import 'package:ecommerce/shared/path/paths.dart';

class AppRoute {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic> route(RouteSettings routers) {
    Route route = fadeTransition(SizedBox());
    switch (routers.name) {
      case SplashScreen.name:
        route = slideTransition(SplashScreen());

      case MainScreen.name:
        route = slideTransition(MainScreen());
    }

    return route;
  }

  static void push(String routeName) =>
      navigatorKey.currentState?.pushNamed(routeName);

  static void pushReplace(String routeName) => navigatorKey.currentState
      ?.restorablePushNamedAndRemoveUntil(routeName, (route) => false);
  static void pop(String routeName) => navigatorKey.currentState?.pop();
}

Route slideTransition(Widget page) => PageRouteBuilder(
  transitionDuration: Duration(milliseconds: 500),
  pageBuilder: (context, animation, secondaryAnimation) => page,
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    final slide = Tween(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(animation);
    return SlideTransition(position: slide, child: child);
  },
);

Route fadeTransition(Widget page) => PageRouteBuilder(
  transitionDuration: Duration(milliseconds: 500),
  pageBuilder: (context, animation, secondaryAnimation) => page,
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    final fade = Tween(begin: 0.0, end: 1.0).animate(animation);
    return FadeTransition(opacity: fade, child: child);
  },
);

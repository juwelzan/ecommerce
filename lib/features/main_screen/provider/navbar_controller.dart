import 'package:ecommerce/features/cart_screen/ui/cart_screen.dart';
import 'package:ecommerce/features/category_screen/ui/category_screen.dart';
import 'package:ecommerce/features/home_screen/presentation/home_scree.dart';
import 'package:ecommerce/shared/path/paths.dart';

class NavbarController with ChangeNotifier {
  List<int> pageRoute = [];
  late int? lastpage;
  int pageIndex = 0;
  bool isNavbarVisible = true;

  void hideNavbar() {
    if (isNavbarVisible) {
      isNavbarVisible = false;
      notifyListeners();
    }
  }

  void showNavbar() {
    if (!isNavbarVisible) {
      isNavbarVisible = true;
      notifyListeners();
    }
  }

  void nextScreen(int pagendex) {
    if (pagendex < 0 || pagendex >= page.length) return;
    pageIndex = pagendex;

    if (pagendex == 2) {
      hideNavbar();
    } else {
      showNavbar();
    }

    if (pagendex == 0) {
      pageRoute.clear();
      pageRoute.add(pagendex);
    } else {
      pageRoute.add(pagendex);
      if (pageRoute.length > 20) {
        pageRoute.removeAt(0);
      }
    }
    lastpage = pagendex;
    LoggerLog.logI("$pageRoute");
    notifyListeners();
  }

  final List<Widget> page = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishlistScreen(),
  ];
  void copyWith({int? index}) {
    pageIndex = index ?? pageIndex;
    notifyListeners();
  }

  void back() {
    showNavbar();
    if (lastpage != null && lastpage == pageRoute.last) {
      pageRoute.removeLast();
      if (pageRoute.isEmpty) {
        pageRoute.add(0);
        pageIndex = 0;
      } else {
        lastpage = pageRoute.last;
        pageIndex = lastpage!;
      }
    }
    LoggerLog.logI("$pageRoute");
    notifyListeners();
  }
}

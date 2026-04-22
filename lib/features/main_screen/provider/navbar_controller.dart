import 'package:ecommerce/features/cart_screen/ui/cart_screen.dart';
import 'package:ecommerce/features/category_screen/ui/category_screen.dart';
import 'package:ecommerce/features/home_screen/presentation/home_scree.dart';
import 'package:ecommerce/features/review_screen/ui/review_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';

class NavbarController with ChangeNotifier {
  final PageController pageController = PageController();
  List<int> pageRoute = [];
  late int? lastpage;
  int pageIndex = 0;

  void nextScreen(int pagendex) {
    pageController.jumpToPage(pagendex);
    pageIndex = pagendex;
    if (pagendex == 0) {
      pageRoute.clear();
      pageRoute.add(pagendex);
    } else {
      pageRoute.add(pagendex);
    }
    lastpage = pagendex;
    notifyListeners();
  }

  final List<Widget> page = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),

    ReviewScreen(),
  ];
  void copyWith({int? index}) {
    pageIndex = index ?? pageIndex;
    notifyListeners();
  }

  void back() {
    if (lastpage != null && lastpage == pageRoute.last) {
      pageRoute.removeLast();
      nextScreen(pageRoute.last);
      lastpage = pageRoute.last;
    }
    notifyListeners();
  }
}

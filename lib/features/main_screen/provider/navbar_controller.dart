import 'package:ecommerce/features/cart_screen/ui/cart_screen.dart';
import 'package:ecommerce/features/home_screen/presentation/home_scree.dart';
import 'package:ecommerce/features/review_screen/ui/review_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';

class NavbarController with ChangeNotifier {
  final PageController pageController = PageController();
  int pageIndex = 0;
  void nextScreen(int pagendex) {
    pageController.jumpToPage(pagendex);
    pageIndex = pagendex;
    notifyListeners();
  }

  final List<Widget> page = <Widget>[
    HomeScreen(),
    CartScreen(),
    CartScreen(),

    ReviewScreen(),
  ];
  void copyWith({int? index}) {
    pageIndex = index ?? pageIndex;
    notifyListeners();
  }
}

import 'dart:async';

import 'package:ecommerce/shared/path/paths.dart';

class BannerController with ChangeNotifier {
  int bannerIndex = 0;
  int index = 0;

  PageController pageController = PageController();

  List<Widget> banner = <Widget>[];

  Timer? timer;
  void autoScrollBanner() {
    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      bannerIndex++;
      if (!pageController.hasClients) return;

      pageController.animateToPage(
        bannerIndex,
        duration: Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
      index = (bannerIndex % 4);

      notifyListeners();
    });
  }

  void update(int inde) {
    timer?.cancel();
    autoScrollBanner();
    bannerIndex = inde;

    index = (inde % 4);

    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
    notifyListeners();
  }
}

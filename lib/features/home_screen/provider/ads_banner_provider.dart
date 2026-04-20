import 'dart:async';

import 'package:ecommerce/features/home_screen/data/ads_danner_data.dart';
import 'package:ecommerce/shared/path/paths.dart';

class AdsBannerProvider extends ChangeNotifier {
  int bannerIndex = 0;
  int index = 0;

  PageController pageController = PageController(viewportFraction: 0.84);

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
      index = (bannerIndex % AdsBannerData.bannerData.length);

      notifyListeners();
    });
  }

  void update(int inde) {
    timer?.cancel();
    autoScrollBanner();
    bannerIndex = inde;

    index = (inde % AdsBannerData.bannerData.length);

    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
    notifyListeners();
  }
}

import 'dart:async';

import 'package:ecommerce/features/home_screen/data/ads_danner_data.dart';
import 'package:ecommerce/shared/path/paths.dart';

class AdsBannerProvider extends ChangeNotifier {
  int bannerIndex = 0;
  int index = 0;
  bool isChange = false;
  double effectValue = 0;

  Timer? timer;
  void autoScrollBanner() {
    timer?.cancel();

    if (AdsBannerData.bannerData.isEmpty) return;
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      isChange = true;
      bannerIndex++;
      if (!pageController.hasClients) return;

      _animateToBanner(bannerIndex, () {
        isChange = false;
      });
      index = (bannerIndex % AdsBannerData.bannerData.length);
      notifyListeners();
    });
    pageController.addListener(() {
      effectValue = pageController.page ?? 0;
      notifyListeners();
    });
  }

  int m = 1;
  void tigger() {
    print(++m);
  }

  void update(int inde) {
    if (!isChange) {
      timer?.cancel();
      _animateToBanner(inde, () {
        autoScrollBanner();
      });
      bannerIndex = inde;

      index = (inde % AdsBannerData.bannerData.length);
      notifyListeners();
      LoggerLog.logW("onChange");
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
    notifyListeners();
  }
}

PageController pageController = PageController();

void _animateToBanner(int index, VoidCallback onTap) {
  pageController
      .animateToPage(
        index,
        duration: Duration(milliseconds: 1000),
        curve: Curves.ease,
      )
      .then((_) => onTap.call());
}

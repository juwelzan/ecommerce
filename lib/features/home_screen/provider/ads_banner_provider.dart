import 'dart:async';

import 'package:ecommerce/features/home_screen/data/ads_danner_data.dart';
import 'package:ecommerce/shared/path/paths.dart';

class AdsBannerProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int bannerIndex = 0;
  int index = 0;
  bool isChange = false;
  bool isAutoScrolling = false;
  double effectValue = 0;

  Timer? timer;
  void autoScrollBanner() {
    if (isAutoScrolling) return;
    timer?.cancel();

    if (AdsBannerData.bannerData.isEmpty) return;
    isAutoScrolling = true;
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
    pageController.removeListener(_handlePageChange);
    pageController.addListener(_handlePageChange);
  }

  void pauseAutoScroll() {
    timer?.cancel();
    timer = null;
    isAutoScrolling = false;
    isChange = false;
  }

  int m = 1;
  void tigger() {
    LoggerLog.logD('${++m}');
  }

  void update(int inde) {
    if (AdsBannerData.bannerData.isEmpty) return;
    if (!isChange) {
      timer?.cancel();
      bannerIndex = inde;

      index = (inde % AdsBannerData.bannerData.length);
      notifyListeners();
      autoScrollBanner();
      LoggerLog.logW("onChange");
    }
  }

  @override
  void dispose() {
    pauseAutoScroll();
    pageController.removeListener(_handlePageChange);
    pageController.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    effectValue = pageController.page ?? 0;
    notifyListeners();
  }

  void _animateToBanner(int banner, VoidCallback onComplete) {
    if (!pageController.hasClients) {
      onComplete();
      return;
    }
    pageController
        .animateToPage(
          banner,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.ease,
        )
        .then((_) => onComplete());
  }
}

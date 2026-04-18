import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/home_screen/model/banner_model.dart';
import 'package:ecommerce/shared/path/paths.dart';

class BannerController with ChangeNotifier {
  int bannerIndex = 0;
  int index = 0;

  PageController pageController = PageController();

  List<Widget> banner = List.generate(BannerOfList.banner.length, (index) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
      child: ClipRRect(
        borderRadius: .circular(15.r),
        child: Image.network(

          fit: BoxFit.cover,
          height: 150.h,
          width: double.infinity,
           BannerOfList.banner[index].imgUrl.toString(),

        ),
      ),
    );
  });

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
      index = (bannerIndex % BannerOfList.banner.length);

      notifyListeners();
    });
  }

  void update(int inde) {
    timer?.cancel();
    autoScrollBanner();
    bannerIndex = inde;

    index = (inde % BannerOfList.banner.length);


    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
    notifyListeners();
  }
}

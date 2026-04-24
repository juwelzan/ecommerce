import 'package:ecommerce/core/di/dependency_injection.dart';
import 'package:ecommerce/features/home_screen/data/ads_danner_data.dart';
import 'package:ecommerce/shared/network_data/get_categories_data.dart';
import 'package:ecommerce/shared/network_data/get_product_data.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:flutter/widget_previews.dart';

class AppConfig extends StatefulWidget {
  @Preview()
  const AppConfig({super.key});

  @override
  State<AppConfig> createState() => _AppConfigState();
}

class _AppConfigState extends State<AppConfig> {
  NetworkCaller networkCaller = NetworkCaller(
    headers: {"Content-Type": "application/json"},
  );
  @override
  void initState() {
    getBanner();
    super.initState();
    getIt<GetCategoriesData>().getAllCategori();
    getIt<GetProductData>().getProduct();
  }

  void getBanner() async {
    final NetworkResponse response = await networkCaller.get(
      url: Urls.getSlideList,
      unauthorized: () {},
    );
    AdsBannerData.bannerSeparate(response.body);
    LoggerLog.logI(AdsBannerData.bannerData.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, state, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,

          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
          routerConfig: AppRoute.goRouter,
        );
      },
    );
  }
}

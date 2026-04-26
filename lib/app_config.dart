import 'package:ecommerce/shared/path/paths.dart';
import 'package:flutter/widget_previews.dart';

class AppConfig extends StatefulWidget {
  @Preview()
  const AppConfig({super.key});

  @override
  State<AppConfig> createState() => _AppConfigState();
}

class _AppConfigState extends State<AppConfig> {
  // NetworkCaller networkCaller = NetworkCaller(
  //   headers: {"Content-Type": "application/json"},
  // );
  // @override
  // void initState() {
  //   getBanner();
  //   super.initState();
  //   getIt<GetCategoriesData>().getAllCategori();
  //   getIt<GetProductData>().getProduct();
  // }

  // void getBanner() async {
  //   final NetworkResponse response = await networkCaller.get(
  //     url: Urls.getSlideList,
  //     unauthorized: () {},
  //   );
  //   AdsBannerData.bannerSeparate(response.body);
  //   LoggerLog.logI(AdsBannerData.bannerData.length.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, state, _) {
        return MaterialApp.router(
          scaffoldMessengerKey: globalContext,
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

final GlobalKey<ScaffoldMessengerState> globalContext =
    GlobalKey<ScaffoldMessengerState>();

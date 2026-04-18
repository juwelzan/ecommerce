

import 'package:ecommerce/shared/path/paths.dart';

import 'features/home_screen/model/banner_model.dart';

class AppConfig extends StatefulWidget {
  const AppConfig({super.key});

  @override
  State<AppConfig> createState() => _AppConfigState();
}

class _AppConfigState extends State<AppConfig> {
  NetworkCaller networkCaller = NetworkCaller(headers: {
    "Content-Type": "application/json",
  });
  @override
  void initState() {
    getBanner();
    super.initState();
  }
  void getBanner() async {
    final NetworkResponse response = await networkCaller.get(
        url: Urls.getSlideList, unauthorized: () {});
    BannerOfList.bannerSeparate(response.body);
    LoggerLog.logI(BannerOfList.banner.length.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, state, _) {
        return MaterialApp(
          navigatorKey: AppRoute.navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.name,
          onGenerateRoute: AppRoute.route,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
        );
      },
    );
  }
}

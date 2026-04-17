

import 'package:ecommerce/shared/path/paths.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ScreenUtil(
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeController()..themeInitial(),
          ),
          ChangeNotifierProvider(create: (context) => SplashProvider()),
          ChangeNotifierProvider(create: (context) => NavbarController()),
          ChangeNotifierProvider(create: (context) => BannerController()),
        ],
        child: AppConfig(),
      ),
    ),
  );
}

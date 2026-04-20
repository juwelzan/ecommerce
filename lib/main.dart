import 'package:ecommerce/core/di/dependency_injection.dart';
import 'package:ecommerce/features/home_screen/provider/ads_banner_provider.dart';
import 'package:ecommerce/shared/path/paths.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Init();
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
          ChangeNotifierProvider(create: (context) => AdsBannerProvider()),
        ],
        child: AppConfig(),
      ),
    ),
  );
}

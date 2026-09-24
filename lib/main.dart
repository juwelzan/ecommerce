import 'package:ecommerce/shared/path/paths.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ScreenUtil(
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeController>(
            create: (context) => ThemeController()..themeInitial(),
          ),
          ChangeNotifierProvider<LocaleController>(
            create: (context) => LocaleController()..load(),
          ),
          ChangeNotifierProvider<AuthController>(
            create: (context) => AuthController()..checkInitialAuth(),
          ),
          ChangeNotifierProvider<SplashProvider>(
            create: (context) => SplashProvider(),
          ),
          ChangeNotifierProvider<NavbarController>(
            create: (context) => NavbarController(),
          ),
          ChangeNotifierProvider<AdsBannerProvider>(
            create: (context) => AdsBannerProvider(),
          ),
          ChangeNotifierProvider<CartController>(
            create: (context) => CartController(),
          ),
          ChangeNotifierProvider<WishlistController>(
            create: (context) => WishlistController(),
          ),
        ],
        child: const AppConfig(),
      ),
    ),
  );
}

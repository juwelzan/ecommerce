import 'package:ecommerce/app_config.dart';
import 'package:ecommerce/core/package/screen_util/screen_util.dart';
import 'package:ecommerce/core/themes/logic/theme_controller.dart';
import 'package:ecommerce/features/home_screen/logic/ads_banner/banner_controller.dart';
import 'package:ecommerce/features/main_screen/provider/navbar_controller.dart';
import 'package:ecommerce/features/splash_screen/provider/splash_provider.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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

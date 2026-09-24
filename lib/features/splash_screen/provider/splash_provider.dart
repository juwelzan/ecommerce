// ignore_for_file: avoid_print

import 'package:ecommerce/shared/path/paths.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier {
  Future<void> startSpash() async {
    await Future.delayed(const Duration(seconds: 4));

    bool hasSeenWelcome = false;
    try {
      final prefs = await SharedPreferences.getInstance();
      hasSeenWelcome = prefs.getBool(Keys.hasSeenWelcome) ?? false;
    } catch (_) {
      hasSeenWelcome = false;
    }

    if (!hasSeenWelcome) {
      AppRoute.goRouter.pushReplacement(WelcomeScreen.name);
    } else {
      AppRoute.goRouter.pushReplacement(MainScreen.name);
    }
  }
}

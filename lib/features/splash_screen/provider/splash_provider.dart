// ignore_for_file: avoid_print

import 'package:ecommerce/shared/path/paths.dart';

class SplashProvider with ChangeNotifier {
  Future<void> startSpash() async {
    await Future.delayed(Duration(seconds: 4));

    AppRoute.goRouter.pushReplacement(MainScreen.name);
  }
}

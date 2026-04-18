// ignore_for_file: avoid_print

import 'package:ecommerce/core/router/app_route.dart';
import 'package:ecommerce/features/home_screen/model/banner_model.dart';
import 'package:ecommerce/shared/path/paths.dart';

class SplashProvider with ChangeNotifier {



  Future<void> startSpash() async {
    await Future.delayed(Duration(seconds: 4));

    AppRoute.pushReplace(MainScreen.name);
  }



}
import 'package:ecommerce/core/package/screen_util/screen_utils_init.dart';

extension ScreenExtension on num {
  double get w => ScreenUtils.w(this);
  double get h => ScreenUtils.h(this);
  double get f => ScreenUtils.f(this);
  double get r => ScreenUtils.r(this);
  double hw({double min = 70, double max = 70}) =>
      ScreenUtils.hw(this, max: max, min: min);
}

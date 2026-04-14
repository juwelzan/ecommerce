// ignore_for_file: non_constant_identifier_names, unused_field

import '../../../shared/path/paths.dart';

class ScreenUtils {
  static Size Default = Size(360, 690);
  static late double _scaleHeigth;
  static late double _scaleWidth;
  static late double _fontSize;
  static late Orientation _orientation;
  static void Init({
    required Size deviseSize,
    required Size screenSize,
    required Orientation orientation,
  }) {
    _scaleHeigth = deviseSize.height / screenSize.height;
    _scaleWidth = deviseSize.width / screenSize.width;
    _fontSize = _scaleWidth > _scaleHeigth ? _scaleWidth : _scaleHeigth;
    _orientation = orientation;
  }

  static double h(num v) => v * _scaleHeigth;
  static double w(num v) => v * _scaleWidth;
  static double f(num v, {double min = 10, double max = 40}) =>
      (v * _fontSize).clamp(min, max);
  static double r(num v) => f(v);

  static double hw(num v, {double min = 30, double max = 70}) =>
      (v * _fontSize).clamp(min, max);

  static bool isPortrait = _orientation == Orientation.portrait;
}

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerLog {
  LoggerLog._();
  static final Logger _logger = Logger();

  static void logD(String message) {
    if (kDebugMode) _logger.d(message);
  }

  static void logE(String message) {
    if (kDebugMode) _logger.e(message);
  }

  static void logI(String message) {
    if (kDebugMode) _logger.i(message);
  }

  static void logW(String message) {
    if (kDebugMode) _logger.w(message);
  }

  static void logV(String message) {
    if (kDebugMode) _logger.t(message);
  }
}

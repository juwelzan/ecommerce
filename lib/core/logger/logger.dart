

import '../../shared/path/paths.dart';

class LoggerLog {
  LoggerLog._();
 static final Logger _logger = Logger();

 static void logD( String message){
    //_logger.d(message);
    _logger.d(message);
  }
 static void logE( String message){
    _logger.e(message);
  }
 static void logI( String message){
    _logger.i(message);
  }
 static void logW( String message){
    _logger.w(message);
  }
  static void logV( String message){
    _logger.v(message);
  }



}
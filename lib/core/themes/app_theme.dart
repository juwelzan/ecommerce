import 'package:ecommerce/core/themes/app_colors.dart';
import 'package:ecommerce/shared/path/paths.dart';

class AppTheme {
  ///Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackGround,
    primaryColor: AppColors.lightPrimary,
    secondaryHeaderColor: AppColors.lightsecondary,
    primaryColorDark: AppColors.darkBackGround,
    primaryColorLight: AppColors.lightBackGround,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.lightText,
        fontWeight: FontWeight.bold,
        fontSize: 40.f,
      ),
      bodySmall: TextStyle(
        color: AppColors.lightSubText,
        fontWeight: FontWeight.w400,
        fontSize: 18.f,
      ),
      titleSmall: TextStyle(
        color: AppColors.lightPrimary,
        fontWeight: .w500,
        fontSize: 10.f,
      ),
      headlineLarge: TextStyle(
        fontSize: 20.f,
        fontWeight: .w600,
        color: AppColors.lightText,
      ),
      headlineMedium: TextStyle(
        fontSize: 15.f,
        color: AppColors.darkPrimary,
        fontWeight: .w600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(width: 2, color: AppColors.darkPrimary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(width: 3, color: AppColors.darkPrimary),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 2, color: Colors.redAccent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1, color: Colors.redAccent),
      ),
      labelStyle: TextStyle(fontSize: 15),

      errorStyle: TextStyle(fontSize: 13),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.lightPrimary,
        maximumSize: Size(.infinity, 50.h),
        minimumSize: Size(.infinity, 50.h),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        textStyle: TextStyle(fontSize: 20.f, fontWeight: .w800),
      ),
    ),
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackGround,
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    primaryColorDark: AppColors.darksecondary,
    secondaryHeaderColor: AppColors.darksecondary,
    primaryColorLight: AppColors.darkBackGround,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.darkText,
        fontWeight: FontWeight.bold,
        fontSize: 40.f,
      ),
      bodySmall: TextStyle(
        color: AppColors.darkSubText,
        fontWeight: FontWeight.w400,
        fontSize: 18.f,
      ),
      titleSmall: TextStyle(
        color: AppColors.lightPrimary,
        fontWeight: .w500,
        fontSize: 10.f,
      ),
      headlineLarge: TextStyle(
        fontSize: 20.f,
        fontWeight: .w600,
        color: AppColors.darkText,
      ),
      headlineMedium: TextStyle(
        fontSize: 15.f,
        color: AppColors.darkPrimary,
        fontWeight: .w600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(width: 2, color: AppColors.darkPrimary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(width: 3, color: AppColors.darkPrimary),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.darkPrimary,
        maximumSize: Size(.infinity, 50.h),
        minimumSize: Size(.infinity, 50.h),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        textStyle: TextStyle(fontSize: 20.f, fontWeight: .w800),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 15.f,
          color: AppColors.darkPrimary,
          fontWeight: .w600,
        ),
      ),
    ),
  );
}

extension Context on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ButtonThemeData get buttonTheme => Theme.of(this).buttonTheme;
}

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
      // Display — large hero text (splash/welcome headings)
      displaySmall: TextStyle(
        color: AppColors.lightText,
        fontWeight: FontWeight.bold,
        fontSize: 28.f,
      ),
      // Headline — screen section headings, AppBar titles
      headlineLarge: TextStyle(
        fontSize: 18.f,
        fontWeight: FontWeight.w700,
        color: AppColors.lightText,
      ),
      headlineMedium: TextStyle(
        fontSize: 15.f,
        fontWeight: FontWeight.w600,
        color: AppColors.lightText,
      ),
      headlineSmall: TextStyle(
        fontSize: 13.f,
        fontWeight: FontWeight.w600,
        color: AppColors.lightPrimary,
      ),
      // Title — card titles, list item titles, product names
      titleLarge: TextStyle(
        fontSize: 14.f,
        fontWeight: FontWeight.w600,
        color: AppColors.lightText,
      ),
      titleMedium: TextStyle(
        fontSize: 13.f,
        fontWeight: FontWeight.w500,
        color: AppColors.lightText,
      ),
      titleSmall: TextStyle(
        fontSize: 11.f,
        fontWeight: FontWeight.w500,
        color: AppColors.lightPrimary,
      ),
      // Body — descriptions, subtitles, general text
      bodyLarge: TextStyle(
        color: AppColors.lightText,
        fontWeight: FontWeight.w400,
        fontSize: 15.f,
      ),
      bodyMedium: TextStyle(
        color: AppColors.lightSubText,
        fontWeight: FontWeight.w400,
        fontSize: 13.f,
      ),
      bodySmall: TextStyle(
        color: AppColors.lightSubText,
        fontWeight: FontWeight.w400,
        fontSize: 11.f,
      ),
      // Label — button text, nav labels, captions
      labelLarge: TextStyle(
        color: AppColors.lightText,
        fontWeight: FontWeight.w600,
        fontSize: 14.f,
      ),
      labelMedium: TextStyle(
        color: AppColors.lightSubText,
        fontWeight: FontWeight.w500,
        fontSize: 12.f,
      ),
      labelSmall: TextStyle(
        color: AppColors.lightSubText,
        fontWeight: FontWeight.w400,
        fontSize: 10.f,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(width: 2.5, color: AppColors.darkPrimary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(width: 3, color: AppColors.darkPrimary),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 3,
          color: Colors.redAccent.withValues(alpha: 0.8),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 2,
          color: Colors.redAccent.withValues(alpha: 0.8),
        ),
      ),
      labelStyle: TextStyle(fontSize: 14.f),
      hintStyle: TextStyle(fontSize: 14.f, color: Colors.grey.shade500),
      errorStyle: TextStyle(fontSize: 12.f),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.lightPrimary,
        maximumSize: Size(double.infinity, 50.h),
        minimumSize: Size(0, 50.h),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        textStyle: TextStyle(fontSize: 15.f, fontWeight: .w700),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.lightPrimary,
        minimumSize: Size(0, 50.h),
        side: const BorderSide(color: AppColors.lightPrimary, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        textStyle: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.lightPrimary,
        minimumSize: Size(48.h, 48.h),
        textStyle: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 16.f,
        fontWeight: FontWeight.w600,
        color: AppColors.lightText,
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
      displaySmall: TextStyle(
        color: AppColors.darkText,
        fontWeight: FontWeight.bold,
        fontSize: 28.f,
      ),
      headlineLarge: TextStyle(
        fontSize: 18.f,
        fontWeight: FontWeight.w700,
        color: AppColors.darkText,
      ),
      headlineMedium: TextStyle(
        fontSize: 15.f,
        fontWeight: FontWeight.w600,
        color: AppColors.darkText,
      ),
      headlineSmall: TextStyle(
        fontSize: 13.f,
        fontWeight: FontWeight.w600,
        color: AppColors.darkPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 14.f,
        fontWeight: FontWeight.w600,
        color: AppColors.darkText,
      ),
      titleMedium: TextStyle(
        fontSize: 13.f,
        fontWeight: FontWeight.w500,
        color: AppColors.darkText,
      ),
      titleSmall: TextStyle(
        fontSize: 11.f,
        fontWeight: FontWeight.w500,
        color: AppColors.darkPrimary,
      ),
      bodyLarge: TextStyle(
        color: AppColors.darkText,
        fontWeight: FontWeight.w400,
        fontSize: 15.f,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkSubText,
        fontWeight: FontWeight.w400,
        fontSize: 13.f,
      ),
      bodySmall: TextStyle(
        color: AppColors.darkSubText,
        fontWeight: FontWeight.w400,
        fontSize: 11.f,
      ),
      labelLarge: TextStyle(
        color: AppColors.darkText,
        fontWeight: FontWeight.w600,
        fontSize: 14.f,
      ),
      labelMedium: TextStyle(
        color: AppColors.darkSubText,
        fontWeight: FontWeight.w500,
        fontSize: 12.f,
      ),
      labelSmall: TextStyle(
        color: AppColors.darkSubText,
        fontWeight: FontWeight.w400,
        fontSize: 10.f,
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
      labelStyle: TextStyle(fontSize: 14.f),
      hintStyle: TextStyle(fontSize: 14.f, color: Colors.grey.shade500),
      errorStyle: TextStyle(fontSize: 12.f),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.darkPrimary,
        maximumSize: Size(double.infinity, 50.h),
        minimumSize: Size(0, 50.h),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        textStyle: TextStyle(fontSize: 15.f, fontWeight: .w700),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkPrimary,
        minimumSize: Size(0, 50.h),
        side: const BorderSide(color: AppColors.darkPrimary, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        textStyle: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkPrimary,
        minimumSize: Size(48.h, 48.h),
        textStyle: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 16.f,
        fontWeight: FontWeight.w600,
        color: AppColors.darkText,
      ),
    ),
  );
}

extension Context on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ButtonThemeData get buttonTheme => Theme.of(this).buttonTheme;
}

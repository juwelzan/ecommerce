import 'package:ecommerce/shared/path/paths.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  Future<void> themeInitial() async {
    final shared = await SharedPreferences.getInstance();
    final getTheme = shared.getString(Keys.themeKey);

    if (getTheme == null) {
      themeMode = ThemeMode.light;
      shared.setString(Keys.themeKey, "${ThemeMode.light}");
    }
    if (getTheme != null) {
      if (getTheme == "${ThemeMode.light}") {
        themeMode = ThemeMode.system;
      }
      if (getTheme == "${ThemeMode.dark}") {
        themeMode = ThemeMode.dark;
      }
      if (getTheme == "${ThemeMode.system}") {
        themeMode = ThemeMode.system;
      }
    }
    ChangeNotifier();
  }

  Future<void> themeTgol(ThemeMode themeMode) async {
    final shared = await SharedPreferences.getInstance();

    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.dark;
      shared.setString(Keys.themeKey, "${ThemeMode.dark}");
    }

    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.light;
      shared.setString(Keys.themeKey, "${ThemeMode.light}");
    }
    if (themeMode == ThemeMode.system) {
      themeMode = ThemeMode.system;
      shared.setString(Keys.themeKey, "${ThemeMode.system}");
    }
    ChangeNotifier();
  }
}

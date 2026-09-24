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
        themeMode = ThemeMode.light;
      }
      if (getTheme == "${ThemeMode.dark}") {
        themeMode = ThemeMode.dark;
      }
      if (getTheme == "${ThemeMode.system}") {
        themeMode = ThemeMode.system;
      }
    }
    notifyListeners();
  }

  Future<void> themeTgol(ThemeMode mode) async {
    final shared = await SharedPreferences.getInstance();
    themeMode = mode;
    await shared.setString(Keys.themeKey, "$mode");
    notifyListeners();
  }
}

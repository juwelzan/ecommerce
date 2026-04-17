

import 'package:ecommerce/shared/path/paths.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, state, _) {
        return MaterialApp(
          navigatorKey: AppRoute.navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.name,
          onGenerateRoute: AppRoute.route,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
        );
      },
    );
  }
}

import 'package:ecommerce/features/auth/ui/login_screnn.dart';
import 'package:ecommerce/features/auth/ui/login_with_email_pass.dart';
import 'package:ecommerce/features/auth/ui/otp_verify_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/city_name_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/confirm_passward_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/email_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/name_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/numbar_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/password_set_screen.dart';
import 'package:ecommerce/features/home_screen/presentation/home_scree.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  AppRoute._();
  static GoRouter goRouter = GoRouter(
    initialLocation: NameSetScreen.name,
    routes: [
      GoRoute(
        path: HomeScreen.name,
        pageBuilder: (context, state) => fadeTransition(HomeScreen()),
      ),
      GoRoute(
        path: SplashScreen.name,
        pageBuilder: (context, state) => fadeTransition(SplashScreen()),
      ),
      GoRoute(
        path: MainScreen.name,
        pageBuilder: (context, state) => fadeTransition(MainScreen()),
      ),
      // GoRoute(
      //   path: LoginScreen.name,
      //   pageBuilder: (context, state) => fadeTransition(LoginScreen()),
      // ),
      GoRoute(
        path: LoginScrenn.name,
        pageBuilder: (context, state) => fadeTransition(LoginScrenn()),
      ),
      GoRoute(
        path: OtpVerifyScreen.name,
        pageBuilder: (context, state) => fadeTransition(OtpVerifyScreen()),
      ),
      GoRoute(
        path: LoginWithEmailPass.name,
        pageBuilder: (context, state) => fadeTransition(LoginWithEmailPass()),
      ),
      GoRoute(
        path: NumbarSetScreen.name,
        builder: (context, state) => NumbarSetScreen(),
      ),
      GoRoute(
        path: CityNameSetScreen.name,
        builder: (context, state) => CityNameSetScreen(),
      ),
      GoRoute(
        path: ConfirmPasswardScreen.name,
        builder: (context, state) =>
            ConfirmPasswardScreen(pass: state.extra as String),
      ),
      GoRoute(
        path: EmailSetScreen.name,
        builder: (context, state) => EmailSetScreen(),
      ),
      GoRoute(
        path: NameSetScreen.name,
        builder: (context, state) => NameSetScreen(),
      ),
      GoRoute(
        path: PasswordSetScreen.name,
        builder: (context, state) => PasswordSetScreen(),
      ),
    ],
  );
}

dynamic slideTransition(Widget page) => CustomTransitionPage(
  child: page,
  transitionDuration: Duration(milliseconds: 500),

  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    final slide = Tween(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(animation);
    return SlideTransition(position: slide, child: child);
  },
);

dynamic fadeTransition(Widget page) => CustomTransitionPage(
  child: page,
  transitionDuration: Duration(milliseconds: 600),

  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    final fade = Tween(begin: 0.0, end: 1.0).animate(animation);
    final scale = Tween(begin: 0.0, end: 1.0).animate(animation);
    return FadeTransition(
      opacity: fade,
      child: ScaleTransition(scale: scale, child: child),
    );
  },
);

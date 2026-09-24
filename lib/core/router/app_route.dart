import 'package:ecommerce/features/auth/ui/login_screnn.dart';
import 'package:ecommerce/features/auth/ui/login_with_email_pass.dart';
import 'package:ecommerce/features/auth/ui/otp_verify_screen.dart';
import 'package:ecommerce/features/auth/ui/forgot_password_screen.dart';
<<<<<<< HEAD
import 'package:ecommerce/features/auth/ui/signup/sign_up_screen.dart';
=======
import 'package:ecommerce/features/auth/ui/signup/city_name_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/confirm_passward_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/email_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/name_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/numbar_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/password_set_screen.dart';
>>>>>>> 0c9fdf6364bf53d28779b3286a04601772a85241
import 'package:ecommerce/features/home_screen/presentation/home_scree.dart';
import 'package:ecommerce/features/search_screen/ui/search_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class AppRoute {
  AppRoute._();
  static GoRouter goRouter = GoRouter(
    initialLocation: SplashScreen.name,
    observers: [routeObserver],
    routes: [
      GoRoute(
        path: HomeScreen.name,
        pageBuilder: (context, state) => fadeTransition(const HomeScreen()),
      ),
      GoRoute(
        path: SplashScreen.name,
        pageBuilder: (context, state) => fadeTransition(const SplashScreen()),
      ),
      GoRoute(
        path: WelcomeScreen.name,
        pageBuilder: (context, state) => slideTransition(const WelcomeScreen()),
      ),
      GoRoute(
        path: MainScreen.name,
        pageBuilder: (context, state) => fadeTransition(const MainScreen()),
      ),
      GoRoute(
        path: CategoryProductsScreen.name,
        pageBuilder: (context, state) => slideTransition(
          CategoryProductsScreen(category: state.extra as CategoryModel),
        ),
      ),
      GoRoute(
        path: ProductDetailsScreen.name,
        pageBuilder: (context, state) => slideTransition(
          ProductDetailsScreen(product: state.extra as ProductModel),
        ),
      ),
      GoRoute(
        path: SearchScreen.name,
        pageBuilder: (context, state) => slideTransition(const SearchScreen()),
      ),
      GoRoute(
        path: ProductListingScreen.name,
        pageBuilder: (context, state) => slideTransition(
          ProductListingScreen(
            title: state.uri.queryParameters['title'] ?? 'All Products',
          ),
        ),
      ),
      GoRoute(
        path: ProfileScreen.name,
        pageBuilder: (context, state) => slideTransition(const ProfileScreen()),
      ),
      GoRoute(
        path: EditProfileScreen.name,
        pageBuilder: (context, state) =>
            slideTransition(const EditProfileScreen()),
      ),
      GoRoute(
        path: OrdersScreen.name,
        pageBuilder: (context, state) => slideTransition(const OrdersScreen()),
      ),
      GoRoute(
        path: AddressScreen.name,
        pageBuilder: (context, state) => slideTransition(const AddressScreen()),
      ),
      GoRoute(
        path: SettingsScreen.name,
        pageBuilder: (context, state) =>
            slideTransition(const SettingsScreen()),
      ),
      GoRoute(
        path: HelpSupportScreen.name,
        pageBuilder: (context, state) =>
            slideTransition(const HelpSupportScreen()),
      ),
      GoRoute(
        path: AboutScreen.name,
        pageBuilder: (context, state) => slideTransition(const AboutScreen()),
      ),
      GoRoute(
        path: NotificationScreen.name,
        pageBuilder: (context, state) =>
            slideTransition(const NotificationScreen()),
      ),
      GoRoute(
        path: CheckoutScreen.name,
        pageBuilder: (context, state) =>
            slideTransition(const CheckoutScreen()),
      ),
      GoRoute(
        path: LoginScrenn.name,
        pageBuilder: (context, state) => slideTransition(const LoginScrenn()),
      ),
      GoRoute(
        path: OtpVerifyScreen.name,
        pageBuilder: (context, state) =>
            slideTransition(OtpVerifyScreen(email: state.extra as String?)),
      ),
      GoRoute(
        path: ForgotPasswordScreen.name,
        pageBuilder: (context, state) => slideTransition(
          ForgotPasswordScreen(initialEmail: state.extra as String?),
        ),
      ),
      GoRoute(
        path: LoginWithEmailPass.name,
        pageBuilder: (context, state) => slideTransition(
          LoginWithEmailPass(initialEmail: state.extra as String?),
        ),
      ),
      GoRoute(
        path: SignUpScreen.name,
        pageBuilder: (context, state) => slideTransition(const SignUpScreen()),
      ),
    ],
  );
}

CustomTransitionPage<void> slideTransition(Widget page) =>
    CustomTransitionPage<void>(
      child: page,
      transitionDuration: const Duration(milliseconds: 320),
      reverseTransitionDuration: const Duration(milliseconds: 280),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOutCubic));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );

CustomTransitionPage<void> fadeTransition(Widget page) =>
    CustomTransitionPage<void>(
      child: page,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final fade = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
        return FadeTransition(opacity: fade, child: child);
      },
    );

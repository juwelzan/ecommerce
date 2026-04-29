import 'package:ecommerce/features/auth/presentation/login_screen.dart';
import 'package:ecommerce/features/auth/presentation/signup_screen.dart';
import 'package:ecommerce/features/auth/widget/login_with_card.dart';
import 'package:ecommerce/shared/path/paths.dart';

class LoginOrCreateScreen extends StatefulWidget {
  const LoginOrCreateScreen({super.key});
  static const String name = "/LoginOrCreateScreen";

  @override
  State<LoginOrCreateScreen> createState() => _LoginOrCreateScreenState();
}

class _LoginOrCreateScreenState extends State<LoginOrCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthWidget(
                  title: "Log in or create an account",
                  subTitle: "",
                  titleSize: 20.f,
                ),

                LoginWithCard(
                  title: "Log in",
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.name);
                  },
                ),
                Gap(h: 10.h),
                LoginWithCard(
                  title: "Sing up",
                  onTap: () => Navigator.pushNamed(context, SignupScreen.name),
                ),
                Gap(h: 10.h),
                LoginWithCard(
                  title: "Continue with Google",
                  svgIcon: Asset.googleIconSVG,
                ),

                Gap(h: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

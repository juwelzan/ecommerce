import 'package:ecommerce/features/auth/widget/i_have_an_account.dart';
import 'package:ecommerce/features/auth/widget/login_with_card.dart';
import 'package:ecommerce/shared/path/paths.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const String name = "/SignupScreen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(h: 50.h),
                AuthWidget(title: "Create Your Account", titleSize: 25.f),
                Gap(h: 40.h),
                TextFormField(
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 15.f),
                ),
                Gap(h: 20.h),
                TextFormField(
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 15.f),
                ),
                Gap(h: 20.h),
                TextFormField(
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 15.f),
                ),
                Gap(h: 20.h),
                TextFormField(
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 15.f),
                ),
                Gap(h: 30.h),
                FilledButton(onPressed: () {}, child: Text("Log in")),
                Gap(h: 30.h),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 3.w,
                        color: Colors.black,
                        radius: BorderRadius.circular(4),
                      ),
                    ),
                    Gap(w: 5.w),
                    Text("ro", style: TextStyle(fontSize: 15.f)),
                    Gap(w: 5.w),
                    Expanded(
                      child: Divider(
                        thickness: 3.w,
                        color: Colors.black,
                        radius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
                Gap(h: 30.h),
                LoginWithCard(
                  svgIcon: Asset.googleIconSVG,
                  title: "Sign up with Google",
                  loding: false,
                ),
                Gap(h: 30.h),
                IHaveAnAccount(),
                Gap(h: 50.h),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

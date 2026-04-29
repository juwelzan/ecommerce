import 'package:ecommerce/features/auth/widget/i_have_an_account.dart';
import 'package:ecommerce/features/auth/widget/login_with_card.dart';
import 'package:ecommerce/shared/path/paths.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String name = "/LoginScreen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  title: "Log in Your account",
                  subTitle: "enter your email and password",
                  titleSize: 30.f,
                ),
                Gap(h: 20.h),
                TextFormField(
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 15.f),
                  textInputAction: TextInputAction.next,
                ),
                Gap(h: 20.h),
                TextFormField(
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 15.f),
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("Forget Password"),
                    ),
                  ],
                ),
                FilledButton(onPressed: () {}, child: Text("Log in")),
                Gap(h: 20.h),
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
                Gap(h: 20.h),
                LoginWithCard(
                  svgIcon: Asset.googleIconSVG,
                  title: "Log in with Google",
                  loding: false,
                ),
                Gap(h: 30.h),
                IDontHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

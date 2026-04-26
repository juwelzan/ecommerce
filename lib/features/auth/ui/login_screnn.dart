import 'package:ecommerce/features/auth/widget/auth_widget.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/jumping_button.dart';

class LoginScrenn extends StatefulWidget {
  const LoginScrenn({super.key});
  static const String name = "/LoginScrenn";

  @override
  State<LoginScrenn> createState() => _LoginScrennState();
}

class _LoginScrennState extends State<LoginScrenn> {
  ValueNotifier<bool> isShowPass = ValueNotifier<bool>(false);
  ValueNotifier<bool> isShowPasslod = ValueNotifier<bool>(false);
  ValueNotifier<bool> google = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(color: Color(0xFFFAFAFA)),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50),

            AuthWidget(
              title: "Welcome Back",
              subTitle: "Please Enter Your Email Address",
              subTitleSize: 20,
              titleSize: 30,
              logoSize: 120,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: .spaceAround,
                children: <Widget>[
                  _textFild(labelText: "Email", hintText: "example@gmail.com"),
                  SizedBox(height: 20),
                  ValueListenableBuilder(
                    valueListenable: isShowPasslod,
                    builder: (context, value, child) {
                      return JumpingButton(
                        borderRadius: .circular(10),
                        isLoding: value,
                        label: "Log In",
                        onTap: () {
                          isShowPasslod.value = !isShowPasslod.value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 50),

            Row(
              children: [
                Expanded(
                  child: Divider(endIndent: 20, indent: 20, thickness: 2),
                ),
                Text("ro"),
                Expanded(
                  child: Divider(endIndent: 20, indent: 20, thickness: 2),
                ),
              ],
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: google,
                    builder: (context, value, child) {
                      return JumpingButton(
                        onTap: () {
                          google.value = !google.value;
                        },
                        color: Colors.transparent,
                        border: Border.all(width: 2, color: Colors.black26),
                        borderRadius: BorderRadius.circular(100),
                        isLoding: value,
                        sidePadding: EdgeInsets.symmetric(horizontal: 20),
                        child: SingleChildScrollView(
                          scrollDirection: .horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: .center,
                            children: [
                              SvgPicture.asset(
                                Asset.googleIconSVG,
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: .w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            const Center(child: Text("Privacy Policy")),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

Widget _textFild({
  String? hintText,
  String? labelText,
  Function(String?)? validator,
  TextEditingController? controller,
  Widget? suffixIcon,

  bool? obscureText,
}) {
  return TextFormField(
    obscureText: obscureText ?? false,
    validator: (value) => validator?.call(value),
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      labelText: labelText,
      suffixIcon: suffixIcon,
      errorText: "error",
    ),
    style: TextStyle(fontSize: 16, fontWeight: .w400),
  );
}

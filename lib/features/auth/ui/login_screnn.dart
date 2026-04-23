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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(color: Color(0xFFFAFAFA)),
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            SvgPicture.asset(Asset.logoSVG),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: .all(10),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFAFAFA),
                border: Border.all(color: Colors.black),
                borderRadius: .circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 60)],
              ),
              child: Column(
                mainAxisAlignment: .spaceAround,
                children: <Widget>[
                  _textFild(labelText: "Email", hintText: "example@gmail.com"),

                  Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: isShowPass,
                        builder: (context, value, child) {
                          return _textFild(
                            labelText: "Password",
                            hintText: "**********",
                            obscureText: value,
                            suffixIcon: JumpingButton(
                              onTap: () {
                                isShowPass.value = !isShowPass.value;
                              },
                              width: 50,
                              height: 40,
                              verticalPadding: 0,
                              horizontalPaddinng: 0,
                              color: Colors.transparent,
                              child: Center(
                                child: Icon(Icons.visibility, size: 30),
                              ),
                            ),
                          );
                        },
                      ),
                      Row(
                        children: [
                          JumpingButton(
                            label: "Forget Password",
                            color: Colors.transparent,
                            verticalPadding: 0,
                            horizontalPaddinng: 0,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),

                  JumpingButton(
                    label: "Log In",
                    width: double.infinity,
                    height: 50,
                    isLoding: false,
                  ),
                ],
              ),
            ),
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

      labelStyle: TextStyle(fontSize: 15),
    ),
    style: TextStyle(fontSize: 16, fontWeight: .w400),
  );
}

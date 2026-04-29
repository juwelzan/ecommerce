import 'package:ecommerce/features/auth/widget/auth_widget.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/jumping_button.dart';

class LoginWithEmailPass extends StatefulWidget {
  static const String name = "/LoginWithEmailPass";
  const LoginWithEmailPass({super.key});

  @override
  State<LoginWithEmailPass> createState() => _LoginWithEmailPassState();
}

class _LoginWithEmailPassState extends State<LoginWithEmailPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            AuthWidget(
              title: "Welcome Back",
              subTitle: "enter your email & password",
              subTitleSize: 20,
              logoSize: 120,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  TextFormField(
                    decoration: _decoration(
                      hintText: "email@example.com",
                      labelText: "Email",
                    ),
                    style: _textStyle(),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: _decoration(
                      hintText: "0-9:A-Z:a-z:!*.etc",
                      labelText: "Password",
                    ),
                    style: _textStyle(),
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      JumpingButton(
                        width: 150,
                        label: "Forget Password",
                        height: 40,
                        color: Colors.transparent,
                        textAlign: .start,
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            JumpingButton(
              isLoding: false,
              isFileBoxShow: true,
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration _decoration({
  bool? isError = false,
  String? errorText,
  String? labelText,
  String? hintText,
}) {
  return InputDecoration(
    filled: isError,
    hintText: hintText,
    hintStyle: TextStyle(fontSize: 20, color: Colors.black38),
    labelText: labelText,
    labelStyle: TextStyle(fontSize: 20, color: Colors.black38),
    fillColor: isError! ? Colors.redAccent.withValues(alpha: 0.2) : null,
    errorText: isError ? errorText : null,

    // focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 3.5,color: )),
  );
}

TextStyle _textStyle() {
  return TextStyle(fontSize: 20);
}

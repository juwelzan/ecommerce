import 'package:ecommerce/features/auth/widget/i_have_an_account.dart';
import 'package:ecommerce/shared/path/paths.dart';

class LoginWithEmailPass extends StatefulWidget {
  static const String name = "/LoginWithEmailPass";
  const LoginWithEmailPass({super.key});

  @override
  State<LoginWithEmailPass> createState() => _LoginWithEmailPassState();
}

class _LoginWithEmailPassState extends State<LoginWithEmailPass> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: 150),
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
                    decoration: decorationEliment(
                      hintText: "email@example.com",
                      labelText: "Email",
                    ),
                    style: textStyleEliment(),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: decorationEliment(
                      hintText: "0-9:A-Z:a-z:!*.etc",
                      labelText: "Password",
                    ),
                    style: textStyleEliment(),
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
            SizedBox(height: 80),
            IHaveAnAccount(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

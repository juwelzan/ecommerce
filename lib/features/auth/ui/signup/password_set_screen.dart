import 'package:ecommerce/shared/path/paths.dart';

class PasswordSetScreen extends StatefulWidget {
  const PasswordSetScreen({super.key});

  @override
  State<PasswordSetScreen> createState() => _PasswordSetScreenState();
}

class _PasswordSetScreenState extends State<PasswordSetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            SizedBox(height: 80),
            Center(child: DotLottieViewWidget(path: Asset.passwordLottie)),

            AuthWidget(
              showIcon: false,
              title: "Password",
              subTitle: "create strong password",
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: decorationEliment(
                  labelText: "Phone",
                  hintText: "01*********",
                ),
                style: textStyleEliment(),
              ),
            ),
            SizedBox(height: 80),
            JumpingButton(
              width: double.infinity,
              scale: 0.95,
              isFileBoxShow: true,
              opacity: 1,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset(Asset.googleIconSVG),
            ),
          ],
        ),
      ),
    );
  }
}

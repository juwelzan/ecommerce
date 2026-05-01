import 'package:ecommerce/features/auth/ui/signup/confirm_passward_screen.dart';
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
            SizedBox(height: 100),
            Center(
              child: LottiePlayer(
                path: Asset.passwordLottie,
                w: 350,
                fit: .cover,
              ),
            ),

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
                  labelText: "Password",
                  hintText: "*********",
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmPasswardScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

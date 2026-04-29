import 'package:ecommerce/features/auth/ui/signup/email_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';

class NumbarSetScreen extends StatefulWidget {
  static const String name = "/NumbarSetScreen";
  const NumbarSetScreen({super.key});

  @override
  State<NumbarSetScreen> createState() => _NumbarSetScreenState();
}

class _NumbarSetScreenState extends State<NumbarSetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            SizedBox(height: 80),
            Center(child: DotLottieViewWidget(path: Asset.phoneNumberLottie)),

            AuthWidget(
              showIcon: false,
              title: "Phone",
              subTitle: "enter your personal number",
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmailSetScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

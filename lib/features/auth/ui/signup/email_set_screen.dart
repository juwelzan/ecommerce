import 'package:ecommerce/features/auth/ui/signup/numbar_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/password_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';

class EmailSetScreen extends StatefulWidget {
  const EmailSetScreen({super.key});

  @override
  State<EmailSetScreen> createState() => _EmailSetScreenState();
}

class _EmailSetScreenState extends State<EmailSetScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NumbarSetScreen()),
        );
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              SizedBox(height: 80),
              Center(
                child: LottiePlayer(
                  path: Asset.emailLottie,
                  w: 200,
                  fit: .cover,
                ),
              ),

              AuthWidget(
                showIcon: false,
                title: "Email",
                subTitle: "Enter your valid email",
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: decorationEliment(
                    labelText: "Email",
                    hintText: "email@exampl.com",
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
                      builder: (context) => PasswordSetScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

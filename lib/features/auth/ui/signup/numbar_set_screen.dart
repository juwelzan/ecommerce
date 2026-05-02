import 'package:ecommerce/features/auth/ui/signup/email_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/slide_animation.dart';

class NumbarSetScreen extends StatefulWidget {
  static const String name = "/NumbarSetScreen";
  const NumbarSetScreen({super.key});

  @override
  State<NumbarSetScreen> createState() => _NumbarSetScreenState();
}

class _NumbarSetScreenState extends State<NumbarSetScreen> {
  final controll = SlideController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {},
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              SizedBox(height: 80),
              Center(
                child: LottiePlayer(
                  path: Asset.phoneNumberLottie,
                  h: 200,
                  w: 200,
                ),
              ).slideDown(),

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
                onTap: () async {
                  controll.reverse();
                  await Future.delayed(
                    Duration(milliseconds: 500),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmailSetScreen()),
                    ),
                  );
                },
              ).slideUp(),
            ],
          ),
        ),
      ),
    );
  }
}

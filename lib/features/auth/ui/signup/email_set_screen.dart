import 'package:ecommerce/features/auth/ui/signup/numbar_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/slide_animation.dart';

class EmailSetScreen extends StatefulWidget {
  const EmailSetScreen({super.key});

  @override
  State<EmailSetScreen> createState() => _EmailSetScreenState();
}

class _EmailSetScreenState extends State<EmailSetScreen> {
  final controll1 = SlideController(
    duration: Duration(milliseconds: 1000),
    reversDuration: Duration(milliseconds: 1000),
    offsetBegin: Offset(0, -5),
    offsetEnd: Offset(0, 0),
  );
  final controll2 = SlideController(
    duration: Duration(milliseconds: 600),
    reversDuration: Duration(milliseconds: 1200),
    offsetBegin: Offset(0, 10),
    offsetEnd: Offset(0, 0),
  );
  final controll3 = SlideController(
    duration: Duration(milliseconds: 800),
    reversDuration: Duration(milliseconds: 600),
    offsetBegin: Offset(0, 7),
    offsetEnd: Offset(0, 0),
  );
  final controll4 = SlideController(
    duration: Duration(milliseconds: 1000),
    reversDuration: Duration(milliseconds: 500),
    offsetBegin: Offset(0, 5),
    offsetEnd: Offset(0, 0),
  );
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
              ).slideMotion(controller: controll1),

              AuthWidget(
                showIcon: false,
                title: "Email",
                subTitle: "Enter your valid email",
              ).slideMotion(controller: controll2),
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
              ).slideMotion(controller: controll3),
              SizedBox(height: 80),
              JumpingButton(
                width: double.infinity,
                scale: 0.95,
                isFileBoxShow: true,
                opacity: 1,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset(Asset.googleIconSVG),
                onTap: () {
                  controll1.reverse();
                  controll2.reverse();
                  controll3.reverse();
                  controll4.reverse();
                  Future.delayed(
                    Duration(milliseconds: 1000),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NumbarSetScreen(),
                      ),
                    ),
                  );
                },
              ).slideMotion(controller: controll4),
            ],
          ),
        ),
      ),
    );
  }
}

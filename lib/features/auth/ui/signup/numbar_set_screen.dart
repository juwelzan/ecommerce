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
  final controll1 = SlideController(
    duration: Duration(milliseconds: 700),
    reversDuration: Duration(milliseconds: 700),
    offsetBegin: Offset(0, -5),
    offsetEnd: Offset(0, 0),
    opacity: Opacitys(begin: 0, end: 1),
  );
  final controll2 = SlideController(
    duration: Duration(milliseconds: 700),
    reversDuration: Duration(milliseconds: 700),
    offsetBegin: Offset(0, 15),
    offsetEnd: Offset(0, 0),
    opacity: Opacitys(begin: 0, end: 1),
  );

  final title = SlideController(
    duration: Duration(milliseconds: 900),
    reversDuration: Duration(milliseconds: 500),
    offsetBegin: Offset(0, 15),
    offsetEnd: Offset(0, 0),
    opacity: Opacitys(begin: 0, end: 1),
  );
  final textfield = SlideController(
    duration: Duration(milliseconds: 1100),
    reversDuration: Duration(milliseconds: 700),
    offsetBegin: Offset(0, 15),
    offsetEnd: Offset(0, 0),
    opacity: Opacitys(begin: 0, end: 1),
  );
  final button = SlideController(
    duration: Duration(milliseconds: 1300),
    reversDuration: Duration(milliseconds: 900),
    offsetBegin: Offset(0, 15),
    offsetEnd: Offset(0, 0),
    opacity: Opacitys(begin: 0, end: 1),
  );

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
              ).slideMotion(controller: controll1),
              SizedBox(height: 60),
              Container(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 40,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    AuthWidget(
                      showIcon: false,
                      title: "Phone",
                      subTitle: "Enter your personal number",
                    ).slideMotion(controller: title),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: email,
                      decoration: decorationEliment(
                        labelText: "Phone",
                        hintText: "01*********",
                      ),
                      style: textStyleEliment(),
                    ).slideMotion(controller: textfield),
                    SizedBox(height: 80),
                    JumpingButton(
                      width: double.infinity,
                      scale: 0.95,
                      isFileBoxShow: true,
                      opacity: 1,

                      child: SvgPicture.asset(Asset.googleIconSVG),
                      onTap: () async {
                        controll1.reverse();
                        controll2.reverse();
                        title.reverse();
                        textfield.reverse();
                        button.reverse();

                        await Future.delayed(
                          Duration(milliseconds: 1000),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmailSetScreen(),
                            ),
                          ),
                        );
                      },
                    ).slideMotion(controller: button),
                  ],
                ),
              ).slideMotion(controller: controll2),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}

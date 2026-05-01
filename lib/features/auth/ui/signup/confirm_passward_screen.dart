import 'package:animate_do/animate_do.dart';
import 'package:ecommerce/features/auth/ui/signup/city_name_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';

class ConfirmPasswardScreen extends StatefulWidget {
  const ConfirmPasswardScreen({super.key});

  @override
  State<ConfirmPasswardScreen> createState() => _ConfirmPasswardScreenState();
}

class _ConfirmPasswardScreenState extends State<ConfirmPasswardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: LottiePlayer(
                path: Asset.passwordLottie,
                w: 350,
                fit: .cover,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FadeInUp(
              child: Container(
                height: 400,
                margin: .symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xff46FcFd).withValues(alpha: 0.8),
                ),
                child: Column(
                  children: [
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
                    FadeInUp(
                      child: JumpingButton(
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
                              builder: (context) => CityNameSetScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

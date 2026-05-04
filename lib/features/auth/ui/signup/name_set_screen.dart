import 'package:ecommerce/features/auth/ui/signup/email_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class NameSetScreen extends StatelessWidget {
  static const String name = "/NameSetScreen";
  const NameSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: "Your Name",
      subTitle: "Enter your full name",
      hintText: "Md juwel",
      lable: "Fast Name",
      lable2: "Last Name",
      hintText2: "islam,mia,roy etc",
      lottie: Asset.userLottie,
      isShowSecondFild: true,
      onSubmitText: (fastFild, secondFild) {
        context.pushReplacement(EmailSetScreen.name);
      },
    );
  }
}

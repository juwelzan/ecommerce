import 'package:ecommerce/features/auth/model/signup_model.dart';
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
      validator1: (value) {
        if (value!.isEmpty) {
          return "enter your fast name";
        }
        if (value.length < 5) {
          return "enter your correct fast name";
        }
        return null;
      },
      validator2: (value) {
        if (value!.isEmpty) {
          return "enter your last name";
        }
        if (value.length < 3) {
          return "enter your correct last name";
        }
        return null;
      },
      onSubmitText: (fastFild, secondFild) {
        context.pushReplacement(
          EmailSetScreen.name,
          extra: SignupModel(fastName: fastFild, lastName: secondFild),
        );
      },
    );
  }
}

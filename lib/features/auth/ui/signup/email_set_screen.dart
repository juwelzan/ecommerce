import 'package:ecommerce/features/auth/ui/signup/name_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/numbar_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class EmailSetScreen extends StatelessWidget {
  static const String name = "/EmailSetScreen";
  const EmailSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: "Email",
      subTitle: "Enter valid email",
      hintText: "01000000000",
      lable: "Phone",
      lottie: Asset.passwordLottie,
      backScreenPath: NameSetScreen.name,
      onSubmitText: (fastFild, secondFild) {
        context.pushReplacement(NumbarSetScreen.name);
      },
    );
  }
}

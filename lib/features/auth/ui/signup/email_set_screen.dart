import 'package:ecommerce/features/auth/logic/validation.dart';
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
      hintText: "@mail.com",
      lable: "Email",
      lottie: Asset.emailLottie,
      backScreenPath: NameSetScreen.name,
      onSubmitText: (fastFild, secondFild) {
        context.pushReplacement(NumbarSetScreen.name);
      },
      validator1: (value) {
        if (!Validation.email(value!)) {
          return "invalid email";
        } else {
          return null;
        }
      },
    );
  }
}

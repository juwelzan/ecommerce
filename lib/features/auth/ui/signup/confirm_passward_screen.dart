import 'package:ecommerce/features/auth/ui/signup/password_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';

class ConfirmPasswardScreen extends StatelessWidget {
  final String pass;
  static const String name = "/ConfirmPasswardScreen";
  const ConfirmPasswardScreen({super.key, required this.pass});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: "Password",
      subTitle: "Create strong password",
      hintText: "01000000000",
      lable: "Phone",
      backScreenPath: PasswordSetScreen.name,
      lottie: Asset.passwordLottie,
      validator1: (value) {
        if (value != pass) {
          return "Passwords do not match.";
        }
        return null;
      },
    );
  }
}

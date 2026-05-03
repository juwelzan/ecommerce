import 'package:ecommerce/shared/path/paths.dart';

class PasswordSetScreen extends StatelessWidget {
  static const String name = "/PasswordSetScreen";
  const PasswordSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: "Password",
      subTitle: "Create strong password",
      hintText: "01000000000",
      lable: "Phone",
      lottie: Asset.passwordLottie,
    );
  }
}

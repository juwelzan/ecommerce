import 'package:ecommerce/features/auth/ui/signup/city_name_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/confirm_passward_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

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
      backScreenPath: CityNameSetScreen.name,
      onSubmitText: (fastFild, secondFild) {
        context.pushNamed(ConfirmPasswardScreen.name);
      },
    );
  }
}

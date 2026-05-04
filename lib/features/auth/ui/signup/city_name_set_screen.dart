import 'package:ecommerce/features/auth/ui/signup/numbar_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/password_set_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/path/paths.dart';

class CityNameSetScreen extends StatelessWidget {
  static const String name = "/CityNameSetScreen";
  const CityNameSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: "Password",
      subTitle: "Create strong password",
      hintText: "01000000000",
      lable: "Phone",
      lottie: Asset.waldLottie,
      backScreenPath: NumbarSetScreen.name,
      onSubmitText: (fastFild, secondFild) {
        context.pushReplacement(PasswordSetScreen.name);
      },
    );
  }
}

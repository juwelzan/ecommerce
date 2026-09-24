import 'package:ecommerce/features/auth/model/signup_model.dart';
import 'package:ecommerce/features/auth/ui/signup/city_name_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/confirm_passward_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class PasswordSetScreen extends StatelessWidget {
  static const String name = "/PasswordSetScreen";
  final SignupModel signupModel;
  const PasswordSetScreen({super.key, required this.signupModel});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: context.l10n.password,
      subTitle: context.l10n.createStrongPassword,
      hintText: context.l10n.passwordExample,
      lable: context.l10n.password,
      lottie: Asset.passwordLottie,
      backScreenPath: CityNameSetScreen.name,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      onSubmitText: (fastFild, secondFild) {
        context.pushReplacement(
          ConfirmPasswardScreen.name,
          extra: SignupModel(
            fastName: signupModel.fastName,
            lastName: signupModel.lastName,
            email: signupModel.email,
            number: signupModel.number,
            city: signupModel.city,
            password: fastFild,
          ),
        );
      },
    );
  }
}

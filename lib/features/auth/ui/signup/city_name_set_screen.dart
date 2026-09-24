import 'package:ecommerce/features/auth/model/signup_model.dart';
import 'package:ecommerce/features/auth/ui/signup/numbar_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/password_set_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/path/paths.dart';

class CityNameSetScreen extends StatelessWidget {
  final SignupModel signupModel;
  static const String name = "/CityNameSetScreen";
  const CityNameSetScreen({super.key, required this.signupModel});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: context.l10n.city,
      subTitle: context.l10n.enterCityName,
      hintText: context.l10n.cityExample,
      lable: context.l10n.city,
      lottie: Asset.waldLottie,
      backScreenPath: NumbarSetScreen.name,
      validator1: (value) {
        if (value!.isEmpty) {
          return context.l10n.enterCity;
        }
        if (value.length < 4) {
          return context.l10n.correctName;
        }
        return null;
      },

      onSubmitText: (fastFild, secondFild) {
        context.pushReplacement(
          PasswordSetScreen.name,
          extra: SignupModel(
            fastName: signupModel.fastName,
            lastName: signupModel.lastName,
            email: signupModel.email,
            number: signupModel.number,
            city: fastFild,
          ),
        );
      },
    );
  }
}

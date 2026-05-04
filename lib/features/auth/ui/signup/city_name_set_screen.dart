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
      title: "City",
      subTitle: "Enter your city name",
      hintText: "dhaka,rangpur",
      lable: "City",
      lottie: Asset.waldLottie,
      backScreenPath: NumbarSetScreen.name,
      validator1: (value) {
        if (value!.isEmpty) {
          return "enter city";
        }
        if (value.length < 4) {
          return "correct name";
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
        return null;
      },
    );
  }
}

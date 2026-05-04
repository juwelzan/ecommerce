import 'package:ecommerce/features/auth/model/signup_model.dart';
import 'package:ecommerce/features/auth/ui/signup/password_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';

class ConfirmPasswardScreen extends StatelessWidget {
  final SignupModel signupModel;
  static const String name = "/ConfirmPasswardScreen";
  const ConfirmPasswardScreen({super.key, required this.signupModel});

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
        LoggerLog.logI('''
                        ${signupModel.fastName}
                        ${signupModel.lastName}
                        ${signupModel.email}
                        ${signupModel.number}
                        ${signupModel.city}
                        ${signupModel.password}

                      ''');
        if (value != signupModel.password) {
          return "Passwords do not match.";
        }
        return null;
      },
    );
  }
}

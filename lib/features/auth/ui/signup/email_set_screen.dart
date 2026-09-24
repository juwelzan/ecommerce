import 'package:ecommerce/features/auth/logic/validation.dart';
import 'package:ecommerce/features/auth/model/signup_model.dart';
import 'package:ecommerce/features/auth/ui/signup/name_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/numbar_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class EmailSetScreen extends StatelessWidget {
  static const String name = "/EmailSetScreen";
  final SignupModel signupModel;
  const EmailSetScreen({super.key, required this.signupModel});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: context.l10n.email,
      subTitle: context.l10n.validEmail,
      hintText: context.l10n.mailExample,
      lable: context.l10n.email,
      lottie: Asset.emailLottie,
      backScreenPath: NameSetScreen.name,
      onSubmitText: (fastFild, secondFild) {
        context.pushReplacement(
          NumbarSetScreen.name,
          extra: SignupModel(
            fastName: signupModel.fastName,
            lastName: signupModel.lastName,
            email: fastFild,
          ),
        );
      },
      validator1: (value) {
        if (!Validation.email(value!)) {
          return context.l10n.validEmail;
        } else {
          return null;
        }
      },
    );
  }
}

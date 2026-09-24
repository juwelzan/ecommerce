import 'package:ecommerce/features/auth/logic/validation.dart';
import 'package:ecommerce/features/auth/model/signup_model.dart';
import 'package:ecommerce/features/auth/ui/signup/city_name_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/email_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class NumbarSetScreen extends StatelessWidget {
  final SignupModel signupModel;
  static const String name = "/NumbarSetScreen";
  const NumbarSetScreen({super.key, required this.signupModel});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: context.l10n.phoneNumber,
      subTitle: context.l10n.personalNumber,
      hintText: context.l10n.phoneExample,
      lable: context.l10n.phone,
      backScreenPath: EmailSetScreen.name,
      validator1: (value) {
        if (!Validation.phone(value!)) {
          return context.l10n.enterBdNumber;
        }
        return null;
      },
      onSubmitText: (fastFild, secondFild) {
        context.push(
          CityNameSetScreen.name,
          extra: SignupModel(
            fastName: signupModel.fastName,
            lastName: signupModel.lastName,
            email: signupModel.email,
            number: fastFild,
          ),
        );
      },
    );
  }
}

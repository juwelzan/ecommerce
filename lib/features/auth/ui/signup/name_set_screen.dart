import 'package:ecommerce/features/auth/model/signup_model.dart';
import 'package:ecommerce/features/auth/ui/signup/email_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class NameSetScreen extends StatelessWidget {
  static const String name = "/NameSetScreen";
  const NameSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: context.l10n.yourName,
      subTitle: context.l10n.fullName,
      hintText: context.l10n.nameExample,
      lable: context.l10n.firstName,
      lable2: context.l10n.lastName,
      hintText2: context.l10n.lastNameExample,
      lottie: Asset.userLottie,
      isShowSecondFild: true,
      validator1: (value) {
        if (value!.isEmpty) {
          return context.l10n.enterFirstName;
        }
        if (value.length < 5) {
          return context.l10n.correctFirstName;
        }
        return null;
      },
      validator2: (value) {
        if (value!.isEmpty) {
          return context.l10n.enterLastName;
        }
        if (value.length < 3) {
          return context.l10n.correctLastName;
        }
        return null;
      },
      onSubmitText: (fastFild, secondFild) {
        context.pushReplacement(
          EmailSetScreen.name,
          extra: SignupModel(fastName: fastFild, lastName: secondFild),
        );
      },
    );
  }
}

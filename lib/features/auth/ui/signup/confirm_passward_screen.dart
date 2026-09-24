import 'package:ecommerce/features/auth/model/signup_model.dart';
import 'package:ecommerce/features/auth/ui/otp_verify_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/password_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class ConfirmPasswardScreen extends StatelessWidget {
  final SignupModel signupModel;
  static const String name = "/ConfirmPasswardScreen";
  const ConfirmPasswardScreen({super.key, required this.signupModel});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: context.l10n.password,
      subTitle: context.l10n.confirmPasswordSubtitle,
      hintText: context.l10n.enterPassword,
      lable: context.l10n.password,
      backScreenPath: PasswordSetScreen.name,
      lottie: Asset.passwordLottie,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator1: (value) {
        if (value == null || value.isEmpty) {
          return context.l10n.enterPasswordError;
        }
        if (value != signupModel.password) {
          return context.l10n.registrationError;
        }
        return null;
      },
      onSubmitText: (fastField, secondField) async {
        final auth = context.read<AuthController>();
        final success = await auth.signup(signupModel);
        if (!context.mounted) return;

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.l10n.accountCreated),
              backgroundColor: Colors.green,
            ),
          );
          context.pushReplacement(
            OtpVerifyScreen.name,
            extra: signupModel.email,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.localizedError(auth.errorMessage, 'registrationError'),
              ),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
    );
  }
}

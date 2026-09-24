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
      title: "Confirm Password",
      subTitle: "Re-enter your password to confirm",
      hintText: "Re-enter password",
      lable: "Confirm Password",
      backScreenPath: PasswordSetScreen.name,
      lottie: Asset.passwordLottie,
      validator1: (value) {
        if (value == null || value.isEmpty) {
          return "Please re-enter your password";
        }
        if (value != signupModel.password) {
          return "Passwords do not match.";
        }
        return null;
      },
      onSubmitText: (fastField, secondField) async {
        final auth = context.read<AuthController>();
        final success = await auth.signup(signupModel);
        if (!context.mounted) return;

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Account created! Please verify your email with the OTP."),
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
              content: Text(auth.errorMessage ?? "Registration failed. Please try again."),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
    );
  }
}

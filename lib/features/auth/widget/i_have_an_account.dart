import 'package:ecommerce/features/auth/ui/login_with_email_pass.dart';
import 'package:ecommerce/features/auth/ui/signup/sign_up_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

/// Shared sizes/styles for auth interactive controls (matches app theme).
abstract final class AuthButtonStyle {
  static double get height => 50.h;
  static double get minTap => 48.h;
  static BorderRadius get radius => BorderRadius.circular(14.r);

  static ButtonStyle primaryFilled(BuildContext context) {
    return FilledButton.styleFrom(
      minimumSize: Size(double.infinity, height),
      maximumSize: Size(double.infinity, height),
      shape: RoundedRectangleBorder(borderRadius: radius),
      textStyle: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w700),
    );
  }

  static ButtonStyle secondaryOutlined(BuildContext context) {
    final primary = context.theme.primaryColor;
    return OutlinedButton.styleFrom(
      foregroundColor: primary,
      minimumSize: Size(double.infinity, height),
      maximumSize: Size(double.infinity, height),
      side: BorderSide(color: primary, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: radius),
      textStyle: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
    );
  }

  static ButtonStyle textAction(BuildContext context) {
    final primary = context.theme.primaryColor;
    return TextButton.styleFrom(
      foregroundColor: primary,
      minimumSize: Size(minTap, minTap),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
    );
  }
}

void navigateToSignUp(BuildContext context) {
  context.push(SignUpScreen.name);
}

void navigateToLogin(BuildContext context) {
  // Avoid Login → SignUp → Login duplicate stacks.
  context.pushReplacement(LoginWithEmailPass.name);
}

/// Secondary/outlined "Create Account" / Sign Up action on Login screens.
class IDontHaveAnAccount extends StatelessWidget {
  final VoidCallback? onTap;
  final bool enabled;

  const IDontHaveAnAccount({super.key, this.onTap, this.enabled = true});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return SizedBox(
      width: double.infinity,
      height: AuthButtonStyle.height,
      child: OutlinedButton(
        onPressed: enabled ? (onTap ?? () => navigateToSignUp(context)) : null,
        style: AuthButtonStyle.secondaryOutlined(context),
        child: Text(context.l10n.createAccount),
      ),
    );
  }
}

/// "Already have an account? Sign in" action on Sign Up screens.
class IHaveAnAccount extends StatelessWidget {
  final VoidCallback? onTap;
  final bool enabled;

  const IHaveAnAccount({super.key, this.onTap, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: enabled ? (onTap ?? () => navigateToLogin(context)) : null,
        style: AuthButtonStyle.textAction(context),
        child: Text(context.l10n.haveAccountLogin, textAlign: TextAlign.center),
      ),
    );
  }
}

/// Styled text button for Forgot Password.
class AuthForgotPasswordButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool enabled;

  const AuthForgotPasswordButton({
    super.key,
    this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: enabled ? onPressed : null,
        style: AuthButtonStyle.textAction(context),
        child: Text(context.l10n.forgotPasswordQuestion),
      ),
=======
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${context.l10n.dontHaveAccount} ",
          style: TextStyle(fontSize: 15.f),
        ),
        GestureDetector(
          onTap: onTap ?? () => context.push(NameSetScreen.name),
          child: Text(
            context.l10n.signup,
            style: TextStyle(
              fontSize: 15.f,
              color: context.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text("?", style: TextStyle(fontSize: 15.f)),
      ],
>>>>>>> 0c9fdf6364bf53d28779b3286a04601772a85241
    );
  }
}

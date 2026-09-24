import 'package:ecommerce/features/auth/ui/login_with_email_pass.dart';
import 'package:ecommerce/features/auth/ui/signup/name_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class IHaveAnAccount extends StatelessWidget {
  final VoidCallback? onTap;
  const IHaveAnAccount({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${context.l10n.haveAccount} ", style: TextStyle(fontSize: 15.f)),
        GestureDetector(
          onTap: onTap ?? () => context.push(LoginWithEmailPass.name),
          child: Text(
            context.l10n.login,
            style: TextStyle(
              fontSize: 15.f,
              color: context.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text("?", style: TextStyle(fontSize: 15.f)),
      ],
    );
  }
}

class IDontHaveAnAccount extends StatelessWidget {
  final VoidCallback? onTap;
  const IDontHaveAnAccount({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${context.l10n.dontHaveAccount} ", style: TextStyle(fontSize: 15.f)),
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
    );
  }
}

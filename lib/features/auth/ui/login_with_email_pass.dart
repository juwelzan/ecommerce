import 'package:ecommerce/features/auth/logic/validation.dart';
import 'package:ecommerce/features/auth/ui/forgot_password_screen.dart';
import 'package:ecommerce/features/auth/ui/login_screnn.dart';
import 'package:ecommerce/features/auth/ui/signup/name_set_screen.dart';
import 'package:ecommerce/features/auth/widget/i_have_an_account.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class LoginWithEmailPass extends StatefulWidget {
  static const String name = "/LoginWithEmailPass";
  final String? initialEmail;
  const LoginWithEmailPass({super.key, this.initialEmail});

  @override
  State<LoginWithEmailPass> createState() => _LoginWithEmailPassState();
}

class _LoginWithEmailPassState extends State<LoginWithEmailPass> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController email;
  final TextEditingController password = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    email = TextEditingController(text: widget.initialEmail ?? '');
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final auth = context.read<AuthController>();
    final success = await auth.login(
      email: email.text.trim(),
      password: password.text,
    );

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${context.l10n.welcomeBack}, ${auth.user?.fullName ?? context.l10n.userFallback}!',
          ),
          backgroundColor: Colors.green,
        ),
      );
      context.go(MainScreen.name);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.localizedError(auth.errorMessage, 'loginError'),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _showForgotPasswordDialog() {
    context.push(ForgotPasswordScreen.name, extra: email.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(MainScreen.name);
            }
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(h: 20.h),
                AuthWidget(
                  title: context.l10n.welcomeBack,
                  subTitle: context.l10n.loginSubtitle,
                  subTitleSize: 15,
                  logoSize: 100,
                ),
                Gap(h: 30.h),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: decorationEliment(
                    hintText: context.l10n.emailExample,
                    labelText: context.l10n.email,
                  ).copyWith(prefixIcon: const Icon(Icons.email_outlined)),
                  style: textStyleEliment(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return context.l10n.enterEmail;
                    }
                    if (!Validation.email(value.trim())) {
                      return context.l10n.validEmail;
                    }
                    return null;
                  },
                ),
                Gap(h: 20.h),
                TextFormField(
                  controller: password,
                  obscureText: _obscurePassword,
                  decoration:
                      decorationEliment(
                        hintText: context.l10n.enterPassword,
                        labelText: context.l10n.password,
                      ).copyWith(
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                  style: textStyleEliment(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.enterPasswordError;
                    }
                    return null;
                  },
                ),
                Gap(h: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _showForgotPasswordDialog,
                      child: Text(
                        context.l10n.forgotPasswordQuestion,
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(h: 20.h),
                JumpingButton(
                  isLoding: auth.isLoading,
                  isDisable: auth.isLoading,
                  label: context.l10n.login,
                  borderRadius: BorderRadius.circular(14.r),
                  color: context.theme.primaryColor,
                  onTap: _handleLogin,
                ),
                Gap(h: 24.h),
                IDontHaveAnAccount(
                  onTap: () => context.push(NameSetScreen.name),
                ),
                Gap(h: 16.h),
                TextButton(
                  onPressed: () => context.push(LoginScrenn.name),
                  child: Text(
                    context.l10n.otherSignIn,
                    style: TextStyle(fontSize: 14.f, color: Colors.grey),
                  ),
                ),
                Gap(h: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

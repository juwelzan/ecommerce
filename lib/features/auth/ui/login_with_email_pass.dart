import 'package:ecommerce/features/auth/logic/validation.dart';
import 'package:ecommerce/features/auth/ui/forgot_password_screen.dart';
import 'package:ecommerce/features/auth/ui/login_screnn.dart';
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
    if (auth.isLoading) return;

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

<<<<<<< HEAD
  void _openForgotPassword() {
=======
  void _showForgotPasswordDialog() {
>>>>>>> 0c9fdf6364bf53d28779b3286a04601772a85241
    context.push(ForgotPasswordScreen.name, extra: email.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();
    final busy = auth.isLoading;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          tooltip: context.l10n.back,
          icon: const Icon(Icons.arrow_back),
          onPressed: busy
              ? null
              : () {
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
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  enabled: !busy,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [
                    AutofillHints.username,
                    AutofillHints.email,
                  ],
                  textInputAction: TextInputAction.next,
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
                  enabled: !busy,
                  obscureText: _obscurePassword,
<<<<<<< HEAD
                  autofillHints: const [AutofillHints.password],
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    if (!busy) _handleLogin();
                  },
=======
>>>>>>> 0c9fdf6364bf53d28779b3286a04601772a85241
                  decoration:
                      decorationEliment(
                        hintText: context.l10n.enterPassword,
                        labelText: context.l10n.password,
                      ).copyWith(
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
<<<<<<< HEAD
                          tooltip: _obscurePassword
                              ? context.l10n.showPassword
                              : context.l10n.hidePassword,
=======
>>>>>>> 0c9fdf6364bf53d28779b3286a04601772a85241
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
<<<<<<< HEAD
                          onPressed: busy
                              ? null
                              : () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
=======
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
>>>>>>> 0c9fdf6364bf53d28779b3286a04601772a85241
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
<<<<<<< HEAD
                Gap(h: 8.h),
                AuthForgotPasswordButton(
                  enabled: !busy,
                  onPressed: _openForgotPassword,
                ),
                Gap(h: 16.h),
                JumpingButton(
                  isLoding: busy,
                  isDisable: busy,
                  label: context.l10n.login,
                  borderRadius: AuthButtonStyle.radius,
                  color: context.theme.primaryColor,
                  height: AuthButtonStyle.height,
                  onTap: _handleLogin,
                ),
                Gap(h: 16.h),
                IDontHaveAnAccount(
                  enabled: !busy,
                  onTap: () => navigateToSignUp(context),
                ),
                Gap(h: 8.h),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: busy
                        ? null
                        : () => context.pushReplacement(LoginScrenn.name),
                    style: AuthButtonStyle.textAction(context),
                    child: Text(context.l10n.otherSignIn),
=======
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
>>>>>>> 0c9fdf6364bf53d28779b3286a04601772a85241
                  ),
                ),
                Gap(h: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

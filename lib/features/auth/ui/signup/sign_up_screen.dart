import 'package:ecommerce/features/auth/logic/validation.dart';
import 'package:ecommerce/features/auth/model/signup_model.dart';
import 'package:ecommerce/features/auth/ui/otp_verify_screen.dart';
import 'package:ecommerce/features/auth/widget/i_have_an_account.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

/// Sign up — First Name, Last Name, Email, Phone, Password only.
class SignUpScreen extends StatefulWidget {
  static const String name = '/SignUpScreen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final auth = context.read<AuthController>();
    if (auth.isLoading) return;

    final success = await auth.signup(
      SignupModel(
        fastName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        number: _phoneController.text.trim(),
        password: _passwordController.text,
      ),
    );
    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.accountCreated),
          backgroundColor: Colors.green,
        ),
      );
      context.pushReplacement(
        OtpVerifyScreen.name,
        extra: _emailController.text.trim(),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          context.localizedError(auth.errorMessage, 'registrationError'),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void _onBack() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(MainScreen.name);
    }
  }

  String? _required(String? value, String message) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();
    final busy = auth.isLoading;
    final l10n = context.l10n;
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.createAccount),
        leading: IconButton(
          tooltip: l10n.back,
          icon: const Icon(Icons.arrow_back),
          onPressed: busy ? null : _onBack,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: AutofillGroup(
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 32.h),
              children: [
                Text(
                  l10n.createAccountSubtitle,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 15.f,
                    height: 1.35,
                    color: textTheme.bodySmall?.color,
                  ),
                ),
                Gap(h: 28.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _SignUpField(
                        controller: _firstNameController,
                        focusNode: _firstNameFocus,
                        nextFocus: _lastNameFocus,
                        label: l10n.firstName,
                        hint: l10n.firstNameExample,
                        icon: Icons.badge_outlined,
                        enabled: !busy,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.givenName],
                        textCapitalization: TextCapitalization.words,
                        validator: (value) =>
                            _required(value, l10n.enterFirstName),
                      ),
                    ),
                    Gap(w: 12.w),
                    Expanded(
                      child: _SignUpField(
                        controller: _lastNameController,
                        focusNode: _lastNameFocus,
                        nextFocus: _emailFocus,
                        label: l10n.lastName,
                        hint: l10n.lastNameExample,
                        icon: Icons.badge_outlined,
                        enabled: !busy,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.familyName],
                        textCapitalization: TextCapitalization.words,
                        validator: (value) =>
                            _required(value, l10n.enterLastName),
                      ),
                    ),
                  ],
                ),
                Gap(h: 16.h),
                _SignUpField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  nextFocus: _phoneFocus,
                  label: l10n.email,
                  hint: l10n.genericEmailExample,
                  icon: Icons.email_outlined,
                  enabled: !busy,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.email],
                  validator: (value) {
                    final required = _required(value, l10n.enterEmail);
                    if (required != null) return required;
                    return Validation.email(value!.trim())
                        ? null
                        : l10n.validEmail;
                  },
                ),
                Gap(h: 16.h),
                _SignUpField(
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  nextFocus: _passwordFocus,
                  label: l10n.phoneNumber,
                  hint: l10n.phoneExample,
                  icon: Icons.phone_outlined,
                  enabled: !busy,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.telephoneNumber],
                  validator: (value) {
                    final required = _required(value, l10n.enterPhone);
                    if (required != null) return required;
                    return Validation.phone(value!.trim())
                        ? null
                        : l10n.validPhone;
                  },
                ),
                Gap(h: 16.h),
                _SignUpField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  label: l10n.password,
                  hint: l10n.enterPassword,
                  icon: Icons.lock_outline,
                  enabled: !busy,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.newPassword],
                  onFieldSubmitted: (_) {
                    if (!busy) _submit();
                  },
                  suffixIcon: IconButton(
                    tooltip: _obscurePassword
                        ? l10n.showPassword
                        : l10n.hidePassword,
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: busy
                        ? null
                        : () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                  ),
                  validator: (value) {
                    final required = _required(value, l10n.enterPasswordError);
                    if (required != null) return required;
                    return value!.length >= 6 ? null : l10n.passwordMinLength;
                  },
                ),
                Gap(h: 32.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: FilledButton(
                    onPressed: busy ? null : _submit,
                    style: FilledButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      disabledBackgroundColor: theme.primaryColor.withValues(
                        alpha: 0.45,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: busy
                        ? SizedBox(
                            width: 22.w,
                            height: 22.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          )
                        : Text(l10n.signup),
                  ),
                ),
                Gap(h: 12.h),
                IHaveAnAccount(
                  enabled: !busy,
                  onTap: () => navigateToLogin(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUpField extends StatelessWidget {
  const _SignUpField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.validator,
    this.focusNode,
    this.nextFocus,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.obscureText = false,
    this.enabled = true,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final String label;
  final String hint;
  final IconData icon;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final bool enabled;
  final Widget? suffixIcon;
  final ValueChanged<String>? onFieldSubmitted;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      autofillHints: autofillHints,
      textCapitalization: textCapitalization,
      onFieldSubmitted: (value) {
        if (nextFocus != null) {
          nextFocus!.requestFocus();
        } else {
          onFieldSubmitted?.call(value);
        }
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      style: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w400),
    );
  }
}

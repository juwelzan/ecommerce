import 'package:ecommerce/features/auth/logic/validation.dart';
import 'package:ecommerce/features/auth/widget/i_have_an_account.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String name = '/ForgotPasswordScreen';
  final String? initialEmail;

  const ForgotPasswordScreen({super.key, this.initialEmail});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.initialEmail ?? '');
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final auth = context.read<AuthController>();
    if (auth.isLoading) return;

    final success = await auth.forgotPassword(email: _emailController.text);
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? context.l10n.forgotPasswordSuccess
              : context.localizedError(
                  auth.errorMessage,
                  'forgotPasswordError',
                ),
        ),
        backgroundColor: success ? Colors.green : Colors.redAccent,
      ),
    );
    if (success) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();
    final busy = auth.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.forgotPassword),
        leading: IconButton(
          tooltip: context.l10n.back,
          icon: const Icon(Icons.arrow_back),
          onPressed: busy
              ? null
              : () => context.canPop()
                    ? context.pop()
                    : context.go(MainScreen.name),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.all(20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(h: 30.h),
                AuthWidget(
                  title: context.l10n.forgotPassword,
                  subTitle: context.l10n.forgotPasswordBody,
                  logoSize: 100,
                ),
                Gap(h: 30.h),
                TextFormField(
                  controller: _emailController,
                  enabled: !busy,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    if (!busy) _submit();
                  },
                  decoration: decorationEliment(
                    labelText: context.l10n.email,
                    hintText: context.l10n.genericEmailExample,
                  ).copyWith(prefixIcon: const Icon(Icons.email_outlined)),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return context.l10n.enterEmail;
                    }
                    return Validation.email(value.trim())
                        ? null
                        : context.l10n.validEmail;
                  },
                ),
                Gap(h: 28.h),
                JumpingButton(
                  isLoding: busy,
                  isDisable: busy,
                  label: context.l10n.sendResetInstructions,
                  color: context.theme.primaryColor,
                  borderRadius: AuthButtonStyle.radius,
                  height: AuthButtonStyle.height,
                  onTap: _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

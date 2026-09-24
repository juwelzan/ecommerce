import 'package:ecommerce/features/auth/logic/validation.dart';
import 'package:ecommerce/features/auth/ui/login_with_email_pass.dart';
import 'package:ecommerce/features/auth/ui/signup/name_set_screen.dart';
import 'package:ecommerce/features/auth/widget/i_have_an_account.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class LoginScrenn extends StatefulWidget {
  const LoginScrenn({super.key});
  static const String name = "/LoginScrenn";

  @override
  State<LoginScrenn> createState() => _LoginScrennState();
}

class _LoginScrennState extends State<LoginScrenn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final ValueNotifier<bool> isShowPasslod = ValueNotifier<bool>(false);
  final ValueNotifier<bool> google = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _emailController.dispose();
    isShowPasslod.dispose();
    google.dispose();
    super.dispose();
  }

  void _onEmailSubmit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final emailText = _emailController.text.trim();
    context.push(LoginWithEmailPass.name, extra: emailText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: <Widget>[
            Gap(h: 20.h),
            AuthWidget(
              title: context.l10n.welcomeBack,
              subTitle: context.l10n.loginSubtitle,
              subTitleSize: 16,
              titleSize: 26,
              logoSize: 100,
            ),
            Gap(h: 30.h),
            Form(
              key: _formKey,
              child: _textField(
                controller: _emailController,
                labelText: context.l10n.email,
                hintText: context.l10n.genericEmailExample,
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
            ),
            Gap(h: 20.h),
            ValueListenableBuilder<bool>(
              valueListenable: isShowPasslod,
              builder: (context, value, child) {
                return JumpingButton(
                  borderRadius: BorderRadius.circular(10.r),
                  isLoding: value,
                  label: context.l10n.login,
                  onTap: _onEmailSubmit,
                );
              },
            ),
            Gap(h: 20.h),
            IDontHaveAnAccount(onTap: () => context.push(NameSetScreen.name)),
            Gap(h: 30.h),
            Row(
              children: [
                Expanded(
                  child: Divider(endIndent: 20, indent: 20, thickness: 1.5),
                ),
                Text(context.l10n.or, style: TextStyle(color: Colors.grey)),
                Expanded(
                  child: Divider(endIndent: 20, indent: 20, thickness: 1.5),
                ),
              ],
            ),
            Gap(h: 30.h),
            ValueListenableBuilder<bool>(
              valueListenable: google,
              builder: (context, value, child) {
                return JumpingButton(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(context.l10n.googleSoon)),
                    );
                  },
                  color: Colors.transparent,
                  border: Border.all(width: 1.5, color: Colors.black26),
                  borderRadius: BorderRadius.circular(100.r),
                  isLoding: value,
                  sidePadding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Asset.googleIconSVG,
                          width: 32.w,
                          height: 32.h,
                        ),
                        Gap(w: 12.w),
                        Text(
                          context.l10n.otherSignIn,
                          style: TextStyle(
                            fontSize: 16.f,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Gap(h: 40.h),
            Center(
              child: Text(
                context.l10n.privacyPolicy,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13.f),
              ),
            ),
            Gap(h: 30.h),
          ],
        ),
      ),
    );
  }
}

Widget _textField({
  String? hintText,
  String? labelText,
  TextEditingController? controller,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: hintText,
      labelText: labelText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      prefixIcon: const Icon(Icons.email_outlined),
    ),
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  );
}

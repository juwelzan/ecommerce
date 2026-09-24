import 'package:ecommerce/features/auth/widget/pin_put.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class OtpVerifyScreen extends StatefulWidget {
  static const String name = "/OtpVerufyScreen";
  final String? email;
  const OtpVerifyScreen({super.key, this.email});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  String _otpCode = "";
  final ValueNotifier<bool> isOk = ValueNotifier(false);

  @override
  void dispose() {
    isOk.dispose();
    super.dispose();
  }

  Future<void> _handleVerify() async {
    final email = widget.email?.trim() ?? "";
    if (email.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.emailNotFound)));
      return;
    }
    if (_otpCode.length != 4) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.validOtp)));
      return;
    }

    final auth = context.read<AuthController>();
    final success = await auth.verifyOtp(email: email, otp: _otpCode);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${context.l10n.welcome}, ${auth.user?.fullName ?? context.l10n.userFallback}!",
          ),
          backgroundColor: Colors.green,
        ),
      );
      context.go(MainScreen.name);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(auth.errorMessage ?? context.l10n.invalidOtp),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Gap(h: 40.h),
          AuthWidget(
            title: context.l10n.validOtp,
            titleSize: 26,
            subTitle: widget.email != null
                ? context.l10n.otpSentTo(widget.email!)
                : context.l10n.otpSentToEmail,
            subTitleSize: 15,
            logoSize: 100,
          ),
          Gap(h: 30.h),
          OtpPinPut(
            length: 4,
            isError: false,
            boxSize: 65,
            isShowReset: true,
            onChanged: (value) {
              _otpCode = value;
              isOk.value = value.length == 4;
            },
            isDisable: (value) {},
          ),
          Gap(h: 40.h),
          ValueListenableBuilder<bool>(
            valueListenable: isOk,
            builder: (context, value, child) {
              return JumpingButton(
                isDisable: !value || auth.isLoading,
                isLoding: auth.isLoading,
                label: context.l10n.verifyOtp,
                borderRadius: BorderRadius.circular(14.r),
                color: context.theme.primaryColor,
                onTap: _handleVerify,
              );
            },
          ),
          Gap(h: 30.h),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:ecommerce/features/auth/widget/i_have_an_account.dart';
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
    if (auth.isLoading) return;

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
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
            onReset: () {
              final email = widget.email?.trim();
              if (email == null || email.isEmpty) return;
              unawaited(_resendOtp(email));
            },
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
<<<<<<< HEAD
                isDisable: !value || busy,
                isLoding: busy,
=======
                isDisable: !value || auth.isLoading,
                isLoding: auth.isLoading,
>>>>>>> 0c9fdf6364bf53d28779b3286a04601772a85241
                label: context.l10n.verifyOtp,
                borderRadius: AuthButtonStyle.radius,
                color: context.theme.primaryColor,
                height: AuthButtonStyle.height,
                onTap: _handleVerify,
              );
            },
          ),
          Gap(h: 30.h),
        ],
      ),
    );
  }

  Future<void> _resendOtp(String email) async {
    final auth = context.read<AuthController>();
    final success = await auth.resendOtp(email: email);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? context.l10n.otpResent
              : context.localizedError(auth.errorMessage, 'otpResendError'),
        ),
        backgroundColor: success ? Colors.green : Colors.redAccent,
      ),
    );
  }
}

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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email not found. Please try signing up again.")),
      );
      return;
    }
    if (_otpCode.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 4-digit OTP code.")),
      );
      return;
    }

    final auth = context.read<AuthController>();
    final success = await auth.verifyOtp(email: email, otp: _otpCode);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Welcome, ${auth.user?.fullName ?? "User"}!"),
          backgroundColor: Colors.green,
        ),
      );
      context.go(MainScreen.name);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(auth.errorMessage ?? "Invalid OTP code. Please try again."),
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
            title: "Enter OTP Code",
            titleSize: 26,
            subTitle: widget.email != null
                ? "A 4-digit OTP code has been sent to\n${widget.email}"
                : "A 4-digit OTP code has been sent to your email",
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
                isDisable: !value,
                isLoding: auth.isLoading,
                label: "Verify OTP",
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

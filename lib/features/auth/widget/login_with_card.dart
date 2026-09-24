import 'package:ecommerce/features/auth/widget/i_have_an_account.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:lottie/lottie.dart';

class LoginWithCard extends StatelessWidget {
  final String? svgIcon, title;
  final VoidCallback? onTap;
  final bool loding;
  const LoginWithCard({
    super.key,
    this.svgIcon,
    this.title,
    this.onTap,
    this.loding = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AuthButtonStyle.height,
      child: OutlinedButton(
        onPressed: loding ? null : onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black87,
          minimumSize: Size(double.infinity, AuthButtonStyle.height),
          side: const BorderSide(width: 1.5, color: Colors.black38),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgIcon != null)
              SvgPicture.asset(svgIcon!, width: 28.w, height: 28.h),
            if (svgIcon != null) Gap(w: 10.w),
            if (title != null)
              Flexible(
                child: Text(
                  title!,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (loding) ...[
              Gap(w: 10.w),
              Lottie.asset(Asset.lottieLoading, width: 25.w),
            ],
          ],
        ),
      ),
    );
  }
}

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: 10.w, left: 10.w),
        height: 50.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50.hw(max: 50, min: 50)),
          border: BoxBorder.all(
            width: 2.w,
            style: BorderStyle.solid,
            color: Colors.black38,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgIcon != null)
              Visibility(
                visible: svgIcon != null,
                child: SvgPicture.asset(svgIcon!, width: 30.w),
              ),
            Gap(w: 10.w),
            if (title != null)
              Visibility(
                visible: title != null,
                child: Text(
                  title!,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 20.f,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Gap(w: 10.w),
            Visibility(
              visible: loding,
              child: Lottie.asset(Asset.lottieLoading, width: 25.w),
            ),
          ],
        ),
      ),
    );
  }
}

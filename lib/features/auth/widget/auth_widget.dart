import 'package:ecommerce/shared/path/paths.dart';

class AuthWidget extends StatelessWidget {
  final String? title, subTitle;
  final double? titleSize, subTitleSize, logoSize;
  const AuthWidget({
    super.key,
    this.title,
    this.subTitle,
    this.titleSize,
    this.subTitleSize,
    this.logoSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,

      children: [
        SvgPicture.asset(Asset.logoSVG, width: logoSize ?? 130.w),
        Gap(h: 20.h),
        if (title != null)
          Text(
            title!,
            style: context.textTheme.bodyLarge?.copyWith(fontSize: titleSize),
          ),
        if (subTitle != null)
          Text(
            subTitle!,
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: subTitleSize,
            ),
          ),
      ],
    );
  }
}

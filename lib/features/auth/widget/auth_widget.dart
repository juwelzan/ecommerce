import 'package:ecommerce/shared/path/paths.dart';

class AuthWidget extends StatelessWidget {
  final String? title, subTitle;
  final double? titleSize, subTitleSize, logoSize;
  final bool? showIcon;
  const AuthWidget({
    super.key,
    this.title,
    this.subTitle,
    this.titleSize,
    this.subTitleSize,
    this.logoSize,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [
          if (showIcon!)
            SvgPicture.asset(Asset.logoSVG, width: logoSize ?? 100.w),
          Gap(h: 16.h),
          if (title != null)
            Text(
              title!,
              style: context.textTheme.displaySmall?.copyWith(
                fontSize: titleSize,
              ),
            ),
          if (subTitle != null)
            Text(
              subTitle!,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: subTitleSize,
              ),
            ),
        ],
      ),
    );
  }
}

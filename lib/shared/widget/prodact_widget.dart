import 'package:ecommerce/core/themes/app_colors.dart';
import 'package:ecommerce/shared/path/paths.dart';

class ProdactWidget extends StatelessWidget {
  const ProdactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("view");
      },
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
          color: context.theme.secondaryHeaderColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              // offset: Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Image.asset(Asset.navbCart, height: 70.h),
            ),
            Gap(h: 10.h),
            Expanded(
              child: RepaintBoundary(
                child: Container(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.r),
                      bottomRight: Radius.circular(12.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "sdfklghsdljgv sdjfhjdsf sdjfghjdsf sdhfgdsfg",
                        style: context.textTheme.titleLarge?.copyWith(
                          fontSize: 12.f,
                          fontWeight: .w500,
                          color: AppColors.lightText,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$100000",
                            style: context.textTheme.titleMedium?.copyWith(
                              fontSize: 11.f,
                              color: AppColors.lightText,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(Asset.starPNG, width: 13.w),
                              Gap(w: 5.w),
                              Text(
                                "4.5",
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontSize: 11.f,
                                  color: AppColors.lightText,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              print("object");
                            },
                            child: Image.asset(Asset.hardPNG, width: 15.w),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/features/home_screen/data/ads_danner_data.dart';
import 'package:ecommerce/features/home_screen/provider/ads_banner_provider.dart';
import 'package:ecommerce/shared/path/paths.dart';

class AdsBanner extends StatelessWidget {
  const AdsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150.h,
          width: double.infinity,
          child: Consumer<AdsBannerProvider>(
            builder: (context, state, _) {
              return PageView.builder(
                physics: ClampingScrollPhysics(),
                controller: context.read<AdsBannerProvider>().pageController,
                onPageChanged: (value) =>
                    context.read<AdsBannerProvider>().update(value),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: GestureDetector(
                      child: AdsBannerData
                          .bannerImge[index % AdsBannerData.bannerData.length],
                    ),
                  );
                },
              );
            },
          ),
        ),
        Gap(h: 5.h),
        SizedBox(
          height: 15.h,
          child: Consumer<AdsBannerProvider>(
            builder: (context, state, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  bool isActiv = index == state.index;

                  return AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    padding: EdgeInsets.all(2),
                    width: isActiv ? 28.w : 12.w,
                    height: 11.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: isActiv ? 0 : 2,
                        color: isActiv
                            ? context.theme.primaryColor
                            : Colors.grey,
                      ),

                      color: isActiv
                          ? context.theme.primaryColor
                          : Colors.transparent,
                    ),
                    child: isActiv
                        ? Row(
                            mainAxisAlignment: .start,
                            children: [
                              TweenAnimationBuilder(
                                tween: Tween<double>(begin: 0, end: 24.w),
                                duration: Duration(seconds: 5),
                                builder: (context, value, child) {
                                  return Container(
                                    height: 10.h,
                                    width: value,
                                    decoration: BoxDecoration(
                                      color: Color(0xfffafafa),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  );
                                },
                              ),
                            ],
                          )
                        : null,
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}

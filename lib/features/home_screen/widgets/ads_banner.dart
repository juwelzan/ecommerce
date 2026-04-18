import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/home_screen/logic/ads_banner/banner_controller.dart';
import 'package:ecommerce/shared/path/paths.dart';

import '../model/banner_model.dart';

class AdsBanner extends StatelessWidget {
  const AdsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150.h,
          width: double.infinity,
          child: Consumer<BannerController>(

            builder: (context, state,_) {
              return PageView.builder(
                physics: ClampingScrollPhysics(),
                controller: context.read<BannerController>().pageController,
                onPageChanged: (value) =>
                    context.read<BannerController>().update(value),
                itemBuilder: (context, index) {

                  return Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: state.banner[index % BannerOfList.banner.length],
                  );
                },
              );
            }
          ),
        ),
        Gap(h: 5.h),
        SizedBox(
          height: 15.h,
          child: Consumer<BannerController>(
            builder: (context, state, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  bool isActiv = index == state.index;

                  return AnimatedContainer(
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 1000),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    width: isActiv ? 25.w : 12.w,
                    height: 11.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: isActiv
                            ? context.theme.primaryColor
                            : context.textTheme.bodySmall!.color!,
                      ),

                      color: isActiv
                          ? context.theme.primaryColor
                          : Colors.transparent,
                    ),
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

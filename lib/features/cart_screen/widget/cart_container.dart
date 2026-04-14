import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/increment_button.dart';
import 'package:flutter_svg/svg.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: context.isThemeMod == Brightness.light
                ? Colors.black12
                : Colors.white12,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: double.infinity,
            width: 90.h,
            child: Image.asset(Asset.jpegAppleWhite),
          ),
          Gap(w: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("New year special"),
                    SvgPicture.asset(Asset.svgDelete),
                  ],
                ),
                Text("color : red  size : 40"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Asset.svgTaka, width: 15),
                        Text("10000"),
                      ],
                    ),
                    IncrementButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

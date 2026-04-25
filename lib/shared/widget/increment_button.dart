import 'package:ecommerce/shared/path/paths.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 22.w,
          width: 22.w,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: SvgPicture.asset(Asset.svgminus)),
        ),
        Gap(w: 5.w),
        Text("24"),
        Gap(w: 5.w),
        Container(
          height: 22.w,
          width: 22.w,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: SvgPicture.asset(Asset.svgAdd)),
        ),
      ],
    );
  }
}

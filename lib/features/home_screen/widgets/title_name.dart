import 'package:ecommerce/shared/path/paths.dart';

class TitleName extends StatelessWidget {
  const TitleName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          RepaintBoundary(
            child: Text(
              "All Categories",
              style: context.textTheme.headlineLarge,
            ),
          ),
          RepaintBoundary(
            child: TextButton(
              onPressed: () {},
              child: Text("See All", style: context.textTheme.headlineMedium),
            ),
          ),
        ],
      ),
    );
  }
}

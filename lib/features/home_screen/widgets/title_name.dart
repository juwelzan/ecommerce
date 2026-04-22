import 'package:ecommerce/shared/path/paths.dart';

class TitleName extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const TitleName({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          RepaintBoundary(
            child: Text("$title", style: context.textTheme.headlineLarge),
          ),
          RepaintBoundary(
            child: TextButton(
              onPressed: onTap,
              child: Text("See All", style: context.textTheme.headlineMedium),
            ),
          ),
        ],
      ),
    );
  }
}

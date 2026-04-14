import 'package:ecommerce/shared/path/paths.dart';

class CategorieWidget extends StatelessWidget {
  const CategorieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: context.theme.secondaryHeaderColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.asset(
                Asset.navbWish,
                width: 45.w,
                color: context.theme.primaryColor,
              ),
            ),
          ),
          Text("Electronic 112", style: context.textTheme.titleSmall),
        ],
      ),
    );
  }
}

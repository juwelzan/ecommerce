import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class CategorieWidget extends StatelessWidget {
  final CategoryModel data;
  const CategorieWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(CategoryProductsScreen.name, extra: data),
      borderRadius: BorderRadius.circular(10.r),
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
              child: CachedNetworkImage(
                imageUrl: data.icon ?? '',
                width: 45.w,
                color: context.theme.primaryColor,
                fit: .cover,
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ),
            ),
          ),
          Text("${data.title}", style: context.textTheme.titleSmall),
        ],
      ),
    );
  }
}

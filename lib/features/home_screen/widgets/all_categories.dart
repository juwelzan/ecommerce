import 'package:ecommerce/shared/network_data/get_categories_data.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/categorie_widget.dart';

class AllCategories extends StatelessWidget {
  AllCategories({super.key});
  final getCategori = getIt<GetCategoriesData>();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AnimatedBuilder(
        animation: getCategori,
        builder: (context, child) {
          if (getCategori.isLoading && getCategori.allCategory.isEmpty) {
            return const SizedBox(
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return SizedBox(
            height: 100.h,
            child: RepaintBoundary(
              child: ListView.builder(
                itemCount: getCategori.allCategory.length > 10
                    ? 10
                    : getCategori.allCategory.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    CategorieWidget(data: getCategori.allCategory[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

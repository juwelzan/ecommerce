import 'package:ecommerce/core/di/dependency_injection.dart';
import 'package:ecommerce/shared/network_data/get_categories_data.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/categorie_widget.dart';

class AllCategories extends StatelessWidget {
  AllCategories({super.key});
  final getCategori = getIt<GetCategoriesData>();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100.h,
        child: RepaintBoundary(
          child: ListView.builder(
            itemCount: 5,
            physics: BouncingScrollPhysics(),
            scrollDirection: .horizontal,
            itemBuilder: (context, index) {
              final data = getCategori.allCategory;
              return CategorieWidget(data: data[index]);
            },
          ),
        ),
      ),
    );
  }
}

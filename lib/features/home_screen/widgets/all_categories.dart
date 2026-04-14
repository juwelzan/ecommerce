import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/categorie_widget.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100.h,
        child: RepaintBoundary(
          child: ListView.builder(
            itemCount: 20,
            physics: BouncingScrollPhysics(),
            scrollDirection: .horizontal,
            itemBuilder: (context, index) {
              return CategorieWidget();
            },
          ),
        ),
      ),
    );
  }
}

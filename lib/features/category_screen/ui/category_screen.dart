import 'package:ecommerce/core/di/dependency_injection.dart';
import 'package:ecommerce/shared/network_data/get_categories_data.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/categorie_widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  final controller = getIt<GetCategoriesData>();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          context.read<NavbarController>().back(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GridView.builder(
          itemCount: controller.allCategory.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return CategorieWidget(data: controller.allCategory[index]);
          },
        ),
      ),
    );
  }
}

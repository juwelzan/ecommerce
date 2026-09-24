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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            context.l10n.categories,
            style: context.textTheme.headlineLarge,
          ),
        ),
        body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            if (controller.isLoading && controller.allCategory.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.errorMessage != null &&
                controller.allCategory.isEmpty) {
              return Center(
                child: OutlinedButton(
                  onPressed: controller.getAllCategori,
                  child: Text(context.l10n.retry),
                ),
              );
            }
            if (controller.allCategory.isEmpty) {
              return Center(child: Text(context.l10n.noCategories));
            }
            return RefreshIndicator(
              onRefresh: controller.getAllCategori,
              child: GridView.builder(
                padding: EdgeInsets.only(
                  top: 10.h,
                  bottom: 120.h,
                  left: 10.w,
                  right: 10.w,
                ),
                itemCount: controller.allCategory.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) =>
                    CategorieWidget(data: controller.allCategory[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

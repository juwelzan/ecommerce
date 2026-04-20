import 'package:ecommerce/shared/model/category_model.dart';
import 'package:ecommerce/shared/path/paths.dart';

class GetCategoriesData {
  NetworkCaller networkCaller = NetworkCaller(
    headers: {"Content-Type": "application/json"},
  );
  final List<CategoryModel> allCategory = <CategoryModel>[];
  Future<void> getAllCategori() async {
    final decodeData = await networkCaller.get(
      url: Urls.getCategories,
      unauthorized: () {},
    );

    final data = decodeData.body['data']?['results'] as List?;
    List<CategoryModel> listOfData = data != null
        ? data.map((e) => CategoryModel.fromJson(e)).toList()
        : [];
    allCategory.clear();
    allCategory.addAll(listOfData);
    LoggerLog.logI(allCategory.length.toString());
  }
}

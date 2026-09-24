import 'package:ecommerce/shared/path/paths.dart';

class GetCategoriesData extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  final controller = getIt<NetworkCaller>();
  final List<CategoryModel> allCategory = <CategoryModel>[];
  Future<void> getAllCategori() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    final decodeData = await controller.get(
      url: Urls.getCategories,
      unauthorized: () {},
    );

    if (!decodeData.isSuccess) {
      isLoading = false;
      errorMessage = decodeData.errrorM ?? 'Unable to load categories.';
      notifyListeners();
      return;
    }
    final data = decodeData.body?['data']?['results'] as List?;
    List<CategoryModel> listOfData = data != null
        ? data.map((e) => CategoryModel.fromJson(e)).toList()
        : [];
    allCategory.clear();
    allCategory.addAll(listOfData);
    isLoading = false;
    notifyListeners();
    LoggerLog.logI(allCategory.length.toString());
  }
}

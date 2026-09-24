import 'package:ecommerce/shared/path/paths.dart';

class GetProductData extends ChangeNotifier {
  bool isLoding = false;
  String? errorMessage;
  final controller = getIt<NetworkCaller>();
  final List<ProductModel> product = <ProductModel>[];
  Future<void> getProduct() async {
    isLoding = true;
    errorMessage = null;
    notifyListeners();
    final response = await controller.get(
      url: Urls.getProducts,
      unauthorized: () {},
    );

    if (!response.isSuccess || response.body == null) {
      isLoding = false;
      errorMessage = response.errrorM ?? 'Unable to load products.';
      notifyListeners();
      return;
    }

    final rawResults = response.body?['data']?['results'];
    final results = rawResults is List ? rawResults : const <dynamic>[];

    final data = results
        .whereType<Map<String, dynamic>>()
        .map(ProductModel.formJson)
        .toList();
    product
      ..clear()
      ..addAll(data);

    isLoding = false;
    notifyListeners();

    LoggerLog.logD("product lenght : ${product.length}");
  }

  List<ProductModel> byCategory(String? category) =>
      product.where((item) => item.belongsTo(category)).toList();

  List<ProductModel> search(String query) =>
      product.where((item) => item.matches(query)).toList();
}

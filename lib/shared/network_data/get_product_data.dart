import 'package:ecommerce/core/di/dependency_injection.dart';
import 'package:ecommerce/shared/model/product_model.dart';
import 'package:ecommerce/shared/path/paths.dart';

class GetProductData {
  bool isLoding = false;
  final controller = getIt<NetworkCaller>();
  final List<ProductModel> product = <ProductModel>[];
  Future<void> getProduct() async {
    isLoding = true;
    final response = await controller.get(
      url: Urls.getProducts,
      unauthorized: () {},
    );

    if (response.body == null) {
      isLoding = false;
      return;
    }

    final results = List.from(response.body['data']?['results']!);

    final data = results.map((e) => ProductModel.formJson(e)).toList();
    product.addAll(data);

    isLoding = false;

    LoggerLog.logD("product lenght : ${product.length}");
  }
}

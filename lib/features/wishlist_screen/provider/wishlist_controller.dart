import 'package:ecommerce/shared/model/product_model.dart';
import 'package:flutter/foundation.dart';

class WishlistController extends ChangeNotifier {
  final List<ProductModel> items = <ProductModel>[];

  bool contains(ProductModel product) {
    final id = product.id ?? product.slug ?? product.title;
    return items.any((item) => (item.id ?? item.slug ?? item.title) == id);
  }

  void toggle(ProductModel product) {
    if (contains(product)) {
      items.removeWhere((item) {
        final id = product.id ?? product.slug ?? product.title;
        return (item.id ?? item.slug ?? item.title) == id;
      });
    } else {
      items.add(product);
    }
    notifyListeners();
  }
}

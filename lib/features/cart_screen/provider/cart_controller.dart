import 'package:ecommerce/shared/model/product_model.dart';
import 'package:flutter/foundation.dart';

class CartLine {
  final ProductModel product;
  int quantity;

  CartLine({required this.product, this.quantity = 1});

  int get unitPrice => product.currentprice ?? product.regularprice ?? 0;
  int get total => unitPrice * quantity;
}

class CartController extends ChangeNotifier {
  final List<CartLine> items = <CartLine>[];
  String? errorMessage;

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
  int get subtotal => items.fold(0, (sum, item) => sum + item.total);

  int quantityFor(ProductModel product) {
    final id = product.id ?? product.slug ?? product.title;
    return items
        .where(
          (line) =>
              (line.product.id ?? line.product.slug ?? line.product.title) ==
              id,
        )
        .fold(0, (sum, line) => sum + line.quantity);
  }

  bool add(ProductModel product) {
    errorMessage = null;
    if (product.quantity == 0) {
      errorMessage = 'This product is out of stock.';
      notifyListeners();
      return false;
    }
    final id = product.id ?? product.slug ?? product.title;
    final existing = items.cast<CartLine?>().firstWhere(
      (line) =>
          (line?.product.id ?? line?.product.slug ?? line?.product.title) == id,
      orElse: () => null,
    );
    if (existing == null) {
      items.add(CartLine(product: product));
    } else {
      if (product.quantity != null && existing.quantity >= product.quantity!) {
        errorMessage = 'Maximum available quantity already added.';
        notifyListeners();
        return false;
      }
      existing.quantity++;
    }
    notifyListeners();
    return true;
  }

  void increase(CartLine line) {
    if (line.product.quantity != null &&
        line.quantity >= line.product.quantity!) {
      errorMessage = 'Maximum available quantity reached.';
      notifyListeners();
      return;
    }
    line.quantity++;
    notifyListeners();
  }

  void decrease(CartLine line) {
    if (line.quantity == 1) {
      remove(line);
      return;
    }
    line.quantity--;
    notifyListeners();
  }

  void remove(CartLine line) {
    items.remove(line);
    notifyListeners();
  }

  void clear() {
    items.clear();
    notifyListeners();
  }
}

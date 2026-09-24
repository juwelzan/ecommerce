import 'package:ecommerce/features/wishlist_screen/provider/wishlist_controller.dart';
import 'package:ecommerce/shared/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('wishlist toggles the same product without duplicates', () {
    final wishlist = WishlistController();
    final product = ProductModel(id: 'p-1', title: 'Product');

    wishlist.toggle(product);
    wishlist.toggle(product);

    expect(wishlist.items, isEmpty);
    expect(wishlist.contains(product), isFalse);
  });
}

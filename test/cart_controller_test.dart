import 'package:ecommerce/features/cart_screen/provider/cart_controller.dart';
import 'package:ecommerce/shared/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final product = ProductModel(
    id: 'p-1',
    title: 'Demo product',
    currentprice: 120,
  );

  test('adding the same product increases quantity', () {
    final cart = CartController();

    cart.add(product);
    cart.add(product);

    expect(cart.items, hasLength(1));
    expect(cart.items.single.quantity, 2);
    expect(cart.subtotal, 240);
  });

  test('decreasing the last unit removes the line', () {
    final cart = CartController();
    cart.add(product);

    cart.decrease(cart.items.single);

    expect(cart.items, isEmpty);
    expect(cart.itemCount, 0);
  });

  test('does not exceed the available stock', () {
    final cart = CartController();
    final stockedProduct = ProductModel(
      id: 'stocked',
      currentprice: 10,
      quantity: 1,
    );

    expect(cart.add(stockedProduct), isTrue);
    expect(cart.add(stockedProduct), isFalse);
    expect(cart.items.single.quantity, 1);
  });
}

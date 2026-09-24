import 'package:ecommerce/shared/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses products without photos safely', () {
    final product = ProductModel.formJson({
      '_id': 42,
      'title': 'No image product',
      'current_price': 99,
      'photos': null,
    });

    expect(product.id, '42');
    expect(product.title, 'No image product');
    expect(product.currentprice, 99);
    expect(product.photo, isNull);
  });

  test('matches category and searchable product fields', () {
    final product = ProductModel(
      title: 'Running shoe',
      categorySlug: 'shoes',
      description: 'Lightweight sports footwear',
    );

    expect(product.belongsTo('shoes'), isTrue);
    expect(product.belongsTo('electronics'), isFalse);
    expect(product.matches('shoe'), isTrue);
    expect(product.matches('laptop'), isFalse);
  });
}

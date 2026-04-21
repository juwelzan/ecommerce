class ProductModel {
  final String? id, title, regularprice, currentprice, photo, quantity;

  ProductModel({
    this.id,
    this.title,

    this.regularprice,
    this.currentprice,
    this.quantity,

    this.photo,
  });

  factory ProductModel.formJson(Map<String, dynamic> json) {
    final photo = json['photos']!;
    return ProductModel(
      id: json['_id'],

      currentprice: json['current_price'],

      quantity: json['quantity'],
      regularprice: json['regular_price'],

      title: json['title'],

      photo: photo[0],
    );
  }
}

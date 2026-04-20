class BannerModel {
  final String? id;
  final String? imgUrl;
  final String? description;

  final String? product;
  final String? brand;
  final String? category;
  final String? createdAt;
  final String? updatedAt;

  BannerModel({
    this.id,
    this.imgUrl,
    this.description,
    this.product,
    this.brand,
    this.category,
    this.createdAt,
    this.updatedAt,
  });
  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["_id"],
    imgUrl: json["photo_url"],
    description: json["description"],
    product: json["product"],
    brand: json["brand"],
    category: json["category"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );
  Map<String, dynamic> toJson() => {
    "_id": id,
    "photo_url": imgUrl,
    "description": description,
    "product": product,
    "brand": brand,
    "category": category,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

import 'package:ecommerce/core/logger/logger.dart';

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
    id: json["_id"] ,
    imgUrl: json["photo_url"] ,
    description: json["description"] ,
    product: json["product"] ,
    brand: json["brand"],
    category: json["category"]  ,
    createdAt: json["createdAt"] ,
    updatedAt: json["updatedAt"] ,
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

class BannerOfList {
  BannerOfList._();
static   List<BannerModel> banner = [];

 static void bannerSeparate(Map<String, dynamic> data) {


    final results = data['data']?["results"] as List?;
    if (results == null) return;
     List<BannerModel> bannerList = results
        .map((e) => BannerModel.fromJson(e))
        .toList();

banner.addAll(bannerList);
    LoggerLog.logI('''
    ${banner.length}
    ${banner[0].imgUrl}
   
    ${banner[3].description}
   
    ${banner[0].product}
    ${banner[0].brand}
    ${banner[0].category}
    ${banner[0].createdAt}
    ''');

  }
}

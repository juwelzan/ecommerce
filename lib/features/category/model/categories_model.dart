class CategoriesModel {
  final String categoryName, image, id;

  CategoriesModel({
    required this.categoryName,
    required this.image,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {'categoryName': categoryName, 'image': image};
  }
}

class FinalCategory {
  final List<CategoriesModel> category;

  FinalCategory({required this.category});

  factory FinalCategory.fromJson(Map<String, dynamic> json, String id) {
    return FinalCategory(
      category: (json['category'] ?? [])
          .map(
            (cate) => CategoriesModel(
              categoryName: cate['categoryName'].toString(),
              image: cate['image'].toString(),
              id: id,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

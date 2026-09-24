class ProductModel {
  final String? id, title, slug, photo;
  final String? description, brand, categoryId, categorySlug, categoryTitle;
  final int? regularprice, currentprice, quantity;
  final double? rating;

  ProductModel({
    this.id,
    this.title,
    this.regularprice,
    this.currentprice,
    this.quantity,
    this.photo,
    this.slug,
    this.description,
    this.brand,
    this.categoryId,
    this.categorySlug,
    this.categoryTitle,
    this.rating,
  });

  factory ProductModel.formJson(Map<String, dynamic> json) {
    final photos = json['photos'];
    final photo = photos is List ? photos : const <dynamic>[];
    final category = json['category'] ?? json['categories'];
    final categoryMap = category is Map
        ? category
        : category is List && category.isNotEmpty && category.first is Map
        ? category.first as Map
        : const <dynamic, dynamic>{};

    return ProductModel(
      id: json['_id']?.toString(),
      currentprice: json['current_price'],
      quantity: json['quantity'],
      regularprice: json['regular_price'],
      title: json['title']?.toString(),
      photo: photo.isEmpty ? null : photo.first?.toString(),
      slug: json['slug']?.toString(),
      description: json['description']?.toString(),
      brand: json['brand'] is Map
          ? json['brand']['title']?.toString()
          : json['brand']?.toString(),
      categoryId:
          categoryMap['_id']?.toString() ?? json['category_id']?.toString(),
      categorySlug:
          categoryMap['slug']?.toString() ?? json['category_slug']?.toString(),
      categoryTitle: category is String
          ? category
          : categoryMap['title']?.toString() ??
                json['category_title']?.toString(),
      rating: (json['rating'] as num?)?.toDouble(),
    );
  }

  bool belongsTo(String? category) {
    if (category == null || category.isEmpty) return true;
    final normalized = category.toLowerCase();
    return [
      categoryId,
      categorySlug,
      categoryTitle,
    ].whereType<String>().any((value) => value.toLowerCase() == normalized);
  }

  bool matches(String query) {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) return true;
    return [title, slug, description, brand, categoryTitle]
        .whereType<String>()
        .any((value) => value.toLowerCase().contains(normalized));
  }
}

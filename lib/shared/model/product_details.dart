class ProductDetails {
  final String? id,
      title,
      slug,
      metadescription,
      description,
      createdAt,
      updatedAt,
      photo;

  final Categories? categories;
  final Brand? brand;
  final int? regularprice, currentprice, quantity;

  ProductDetails({
    this.id,
    this.title,
    this.slug,
    this.metadescription,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.regularprice,
    this.currentprice,
    this.quantity,
    this.categories,
    this.brand,
    this.photo,
  });

  factory ProductDetails.formJson(Map<String, dynamic> json) {
    final photo = json['photos']!;
    return ProductDetails(
      id: json['_id'],
      brand: Brand.formJson(json['brand']),
      categories: Categories.formJson(json['categories']),
      createdAt: json['createdAt'],
      currentprice: json['current_price'],
      description: json['description'],
      metadescription: json['meta_description'],
      quantity: json['quantity'],
      regularprice: json['regular_price'],
      slug: json['slug'],
      title: json['title'],
      updatedAt: json['updatedAt'],
      photo: photo[0],
    );
  }
}

class Brand {
  final String? id, title, slug, icon;

  Brand({this.id, this.title, this.slug, this.icon});

  factory Brand.formJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      icon: json['icon'],
    );
  }
}

class Categories {
  final String? id, title, slug, icon;
  Categories({this.id, this.title, this.slug, this.icon});

  factory Categories.formJson(List<dynamic> json) {
    final data = json[0]!;
    return Categories(
      id: data['_id'],
      title: data['title'],
      slug: data['slug'],
      icon: data['icon'],
    );
  }
}

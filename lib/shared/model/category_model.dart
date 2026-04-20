class CategoryModel {
  final String? id, icon, title, description, createdAt, updatedAt, slug;

  CategoryModel({
    this.id,
    this.icon,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["_id"],
      icon: json['icon'],
      title: json['title'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      slug: json['slug'],
    );
  }
}

//  "_id": "6812518cea40bfc6edc67356",
//                 "title": "Apply",
//                 "slug": "apply",
//                 "description": "Apply Device",
//                 "icon": "https://cdn-icons-png.flaticon.com/256/0/747.png",
//                 "parent": null,
//                 "createdAt": "2025-04-30T16:36:28.476Z",
//                 "updatedAt": "2025-04-30T16:36:28.476Z",
//                 "__v": 0

// ignore_for_file: deprecated_member_use

import 'package:ecommerce/shared/path/paths.dart';

class ProductModel {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String categoryName;
  final List<String> images;
  final double rating;
  final int reviewCount;
  final bool inStock;
  final DateTime createdAt;
  final List<Color> colors;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryName,
    required this.images,
    required this.rating,
    required this.reviewCount,
    required this.inStock,
    required this.createdAt,
    required this.colors,
    required this.brand,
  });

  factory ProductModel.formMap(Map<String, dynamic> map, String id) {
    return ProductModel(
      id: id,
      name: map['name'].toString(),
      brand: map['brand'].toString(),
      description: map['description'].toString(),
      price: (map['price'] ?? 0).toDouble(),
      categoryName: map['categoryName'].toString(),
      images: List<String>.from(map['images']),
      rating: (map['rating'] ?? 0).toDouble(),
      reviewCount: map['reviewCount'] ?? 0,
      inStock: map['inStock'] ?? true,
      createdAt: DateTime.parse(map['createdAt']),
      colors: (map['colors'] ?? [])
          .map((color) => Color(int.parse(color.replaceFirst('#', '0xff'))))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'brand': brand,
      'description': description,
      'price': price,
      'categoryId': categoryName,
      'images': images,
      'rating': rating,
      'reviewCount': reviewCount,
      'inStock': inStock,
      'createdAt': createdAt.toIso8601String(),
      'colors': colors
          .map((c) => "#${c.value.toRadixString(16).substring(2)}")
          .toList(),
    };
  }
}

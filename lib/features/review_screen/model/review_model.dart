class ReviewModel {
  final String id;
  final String productId;
  final String userId;
  final String userName;
  final String comment;
  final double rating;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.userName,
    required this.comment,
    required this.rating,
    required this.createdAt,
  });

  factory ReviewModel.formMap(Map<String, dynamic> map, String id) {
    return ReviewModel(
      id: id,
      productId: map['productId'],
      userId: map['userId'],
      userName: map['userName'],
      comment: map['comment'],
      rating: (map['rating'] as num).toDouble(),
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'userId': userId,
      'userName': userName,
      'comment': comment,
      'rating': rating,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

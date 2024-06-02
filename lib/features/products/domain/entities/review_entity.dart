import 'package:laza_app/features/auth/data/models/user_model.dart';

class ReviewEntity {
  final String reviewId;
  final String productId;
  final String userId;
  final String review;
  final String username;
  final DateTime? createdAt;
  final double rating;

  ReviewEntity(
      {required this.reviewId,
      required this.productId,
      required this.userId,
      required this.review,
      required this.username,
      this.createdAt,
      required this.rating});
}

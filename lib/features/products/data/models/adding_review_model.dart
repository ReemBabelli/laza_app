import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/products/domain/entities/adding_review_entity.dart';

class AddingReviewModel extends AddingReviewEntity {
  AddingReviewModel(
      {super.token,
      super.productId,
      super.review,
      super.username,
      super.userId,
      super.reviewId,
      required super.rating});

  factory AddingReviewModel.fromJson(Map<String, dynamic> json) {
    return AddingReviewModel(
        token: json[ApiKey.token],
        productId: json[ApiKey.productId],
        userId: json[ApiKey.user],
        review: json[ApiKey.review],
        username: json[ApiKey.username],
        reviewId: json[ApiKey.id],
        rating: json[ApiKey.rating].toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.productId: productId,
      ApiKey.user: userId,
      ApiKey.review: review,
      ApiKey.username: username,
      ApiKey.id: reviewId,
      ApiKey.rating:rating,
    };
  }
}

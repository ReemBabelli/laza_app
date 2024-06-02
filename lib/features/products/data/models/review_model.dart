import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/auth/data/models/user_model.dart';
import 'package:laza_app/features/products/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel(
      {required super.reviewId,
      required super.productId,
      required super.userId,
      required super.review,
      required super.username,
      required super.createdAt,
        required super.rating
      });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        reviewId: json[ApiKey.id],
        productId: json[ApiKey.productId],
        userId: json[ApiKey.user],
        review: json[ApiKey.review],
        username: json[ApiKey.username],
      createdAt: DateTime.parse(json[ApiKey.createdAt],),
      rating: double.parse(json[ApiKey.rating].toStringAsFixed(1)),
    );
  }

  Map<String,dynamic> toJson(){
    return{
      ApiKey.id:reviewId,
      ApiKey.productId:productId,
      ApiKey.review:review,
      ApiKey.username:username,
    };
  }
}

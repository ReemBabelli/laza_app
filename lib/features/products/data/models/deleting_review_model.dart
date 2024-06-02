import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/products/domain/entities/deleteing_review_entity.dart';

class DeletingReviewModel extends DeletingReviewEntity{
  DeletingReviewModel({super.message, super.token,  super.reviewId});

  factory DeletingReviewModel.fromJson(Map<String,dynamic> json){
    return DeletingReviewModel(message: json[ApiKey.message]);
  }

  // Map<String,dynamic> toJson(){
  //   return {
  //   };
  // }
}
import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/auth/domain/entities/is_exist_in_cart_entity.dart';
import 'package:laza_app/features/products/domain/entities/is_exist_in_comments_entity.dart';

class IsExistInCommentsModel extends IsExistInCommentsEntity{
  IsExistInCommentsModel({ super.commentId,  super.token, super.message});

  factory IsExistInCommentsModel.fromJson(Map<String , dynamic> json){
    return IsExistInCommentsModel(message: json[ApiKey.message]);
  }

  Map<String , dynamic> toJson(){
    return{
      ApiKey.commentHave:commentId,
    };
  }
}
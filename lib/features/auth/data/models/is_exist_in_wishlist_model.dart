import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/auth/domain/entities/is_exist_in_cart_entity.dart';
import 'package:laza_app/features/auth/domain/entities/is_exist_in_wishlist_entity.dart';

class IsExistInWishlistModel extends IsExistInWishlistEntity{
  IsExistInWishlistModel({ super.productId,  super.token, super.message});

  factory IsExistInWishlistModel.fromJson(Map<String , dynamic> json){
    return IsExistInWishlistModel(message: json[ApiKey.message]);
  }

  Map<String , dynamic> toJson(){
    return{
      ApiKey.checkHave:productId,
    };
  }
}
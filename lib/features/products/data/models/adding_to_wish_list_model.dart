import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/products/domain/entities/adding_to_wishlist_entity.dart';

class AddingToWishListModel extends AddingToWishListEntity {
  AddingToWishListModel(
      { super.token,  super.productId,  super.message});

  factory AddingToWishListModel.fromJson(Map<String, dynamic> json) {
    return AddingToWishListModel(message: json[ApiKey.message]);
  }

  Map<String, dynamic> toJson(){
    return {
      ApiKey.wishList: productId,
    };
  }
}

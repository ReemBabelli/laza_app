import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/products/domain/entities/adding_to_cart_entity.dart';

class AddingToCartModel extends AddingToCartEntity {
  AddingToCartModel(
      { super.message,  super.token,  super.productId});

  factory AddingToCartModel.fromJson(Map<String,dynamic> json){
    return AddingToCartModel(message: json[ApiKey.message]);
  }

  Map<String,dynamic> toJson(){
    return {
      ApiKey.productId: productId,
    };
  }
}

import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/auth/domain/entities/is_exist_in_cart_entity.dart';

class IsExistInCartModel extends IsExistInCartEntity{
  IsExistInCartModel({ super.productId,  super.token, super.message});

  factory IsExistInCartModel.fromJson(Map<String , dynamic> json){
    return IsExistInCartModel(message: json[ApiKey.message]);
  }

  Map<String , dynamic> toJson(){
    return{
      ApiKey.checkHave:productId,
    };
  }
}
import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/auth/domain/entities/user_entity.dart';
import 'package:laza_app/features/products/data/models/product_model.dart';

class UserModel extends UserEntity {
  UserModel(
      {super.id,
      super.username,
      super.email,
      super.role,
      super.verCode,
      super.resetPassword,
      super.token,
       super.wishList,
       super.cart,
      super.totalPrice});

   UserModel.fromJson(Map<String, dynamic> json) {
    if (json[ApiKey.wishList] != null) {
       wishList = <ProductModel>[];
      json[ApiKey.wishList].forEach((v) {
        wishList!.add(ProductModel.fromJson(v));
      });
    }

    if (json[ApiKey.cart] != null) {
      cart = <ProductModel>[];
      json[ApiKey.cart].forEach((v) {
        cart!.add(ProductModel.fromJson(v));
      });
    }


    id= json[ApiKey.id];
      username= json[ApiKey.username];
      email= json[ApiKey.email];
      role= json[ApiKey.role];
      verCode= json[ApiKey.verCode];
      resetPassword= json[ApiKey.resetPassword];
      token= json[ApiKey.token];;
      totalPrice = json[ApiKey.totalCountCart];


  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.username: username,
      ApiKey.email: email,
      ApiKey.role: role,
      ApiKey.verCode: verCode,
      ApiKey.resetPassword: resetPassword,
      ApiKey.token: token
    };
  }
}

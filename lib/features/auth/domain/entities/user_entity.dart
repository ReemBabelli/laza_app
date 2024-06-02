import 'package:equatable/equatable.dart';
import 'package:laza_app/features/products/data/models/product_model.dart';
import 'package:laza_app/features/products/data/models/review_model.dart';
import 'package:laza_app/features/products/domain/entities/product_entity.dart';

class UserEntity {
   String? id;
   String? username;
   String? email;
   String? role;
   String? verCode;
   bool? resetPassword;
   String? token;
   List<ProductModel>? wishList;
   List<ProductModel>? cart;
   List<ReviewModel>? reviews;
   int? totalPrice;


  UserEntity(
      { this.id,
       this.username,
       this.email,
       this.role,
       this.verCode,
       this.resetPassword,
       this.token,
       this.wishList,
         this.cart,
        this.totalPrice
      });


}

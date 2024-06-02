import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/products/data/models/products_model.dart';
import 'package:laza_app/features/products/domain/entities/search_for_product_entity.dart';

class SearchForProductModel extends SearchForProductEntity {
  SearchForProductModel(
      { super.productName,  super.productsEntity});

  factory SearchForProductModel.fromJson(Map<String, dynamic> json) {
    return SearchForProductModel(
        productsEntity: ProductsModel.fromJson(json[ApiKey.products])
    );
  }

  // Map<String, dynamic> toJson(){
  //   return {
  //   };
  // }
}

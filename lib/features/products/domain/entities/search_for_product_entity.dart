import 'package:laza_app/features/products/domain/entities/products_entity.dart';

class SearchForProductEntity{
  final String? productName;
  final ProductsEntity? productsEntity;

  SearchForProductEntity({ this.productName,  this.productsEntity});
}
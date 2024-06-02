import 'package:laza_app/features/products/data/models/product_model.dart';

class ProductsEntity{
  // final String? id;
  List<ProductModel>? products;
  int? totalCount;
  int? documentCount;
  final String? brandId;

  ProductsEntity({  this.brandId, this.products, this.totalCount, this.documentCount});

}
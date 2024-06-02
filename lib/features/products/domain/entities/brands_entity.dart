import 'package:laza_app/features/products/data/models/brand_model.dart';

class BrandsEntity{
   List<BrandModel>? brands;
   int? totalCount;
   int? documentCount;

  BrandsEntity({ this.brands,  this.totalCount,  this.documentCount});
}
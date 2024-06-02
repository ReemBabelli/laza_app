import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/products/data/models/brands_model.dart';
import 'package:laza_app/features/products/domain/entities/brand_entity.dart';
import 'package:laza_app/features/products/data/models/product_model.dart';

class BrandModel extends BrandEntity {
  BrandImage? brandImage;
  String? brandName;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<ProductModel>? products;
  String? id;

  BrandModel(
      {
        this.brandImage,
        this.brandName,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.products,
        this.id,
         super.brandId});

  BrandModel.fromJson(Map<String, dynamic> json) {
    brandImage = json[ApiKey.brandImage] != null
        ?  BrandImage.fromJson(json[ApiKey.brandImage])
        : null;
    brandName = json[ApiKey.brandName];
    createdAt = json[ApiKey.createdAt];
    updatedAt = json[ApiKey.updatedAt];
    iV = json[ApiKey.v];
    if (json[ApiKey.products] != null) {
      products = <ProductModel>[];
      json[ApiKey.products].forEach((v) {
        products!.add( ProductModel.fromJson(v));
      });
    }
    id = json[ApiKey.id];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (brandImage != null) {
      data[ApiKey.brandImage] = brandImage!.toJson();
    }
    data[ApiKey.brandName] = brandName;
    data[ApiKey.createdAt] = createdAt;
    data[ApiKey.updatedAt] = updatedAt;
    data[ApiKey.v] = iV;
    if (products != null) {
      data[ApiKey.products] = products!.map((v) => v.toJson()).toList();
    }
    data[ApiKey.id] = id;
    return data;
  }
}
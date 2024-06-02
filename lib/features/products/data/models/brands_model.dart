import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/products/data/models/brand_model.dart';
import 'package:laza_app/features/products/domain/entities/brands_entity.dart';

class BrandsModel extends BrandsEntity {


  BrandsModel({super.brands, super.totalCount, super.documentCount});

  BrandsModel.fromJson(Map<String, dynamic> json) {
    if (json[ApiKey.brands] != null) {
      brands = <BrandModel>[];
      json[ApiKey.brands].forEach((v) {
        brands!.add( BrandModel.fromJson(v));
      });
    }
    totalCount = json[ApiKey.totalCount];
    documentCount = json[ApiKey.documentCount];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (brands != null) {
      data[ApiKey.brands] = brands!.map((v) => v.toJson()).toList();
    }
    data[ApiKey.totalCount] = totalCount;
    data[ApiKey.documentCount] = documentCount;
    return data;
  }
}


class BrandImage {
  String url;
  String? publicId;

  BrandImage({required this.url, this.publicId});

  factory BrandImage.fromJson(Map<String, dynamic> json) {
    return BrandImage(url: json[ApiKey.url]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[ApiKey.url] = url;
    data[ApiKey.publicId] = publicId;
    return data;
  }
}
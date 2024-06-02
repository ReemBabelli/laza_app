import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/products/data/models/product_model.dart';
import 'package:laza_app/features/products/domain/entities/products_entity.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel(
      {super.products, super.totalCount, super.documentCount, super.brandId});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json[ApiKey.products] != null) {
      products = <ProductModel>[];
      json[ApiKey.products].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
    totalCount = json[ApiKey.totalCount];
    documentCount = json[ApiKey.documentCount];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (products != null) {
      data[ApiKey.products] = products!.map((v) => v.toJson()).toList();
    }
    data[ApiKey.totalCount] = totalCount;
    data[ApiKey.documentCount] = documentCount;
    return data;
  }
}

class ProductImages {
  String? url;
  String? publicId;

  ProductImages({this.url, this.publicId});

  ProductImages.fromJson(Map<String, dynamic> json) {
    url = json[ApiKey.url];
    publicId = json[ApiKey.publicId];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[ApiKey.url] = url;
    data[ApiKey.publicId] = publicId;

    return data;
  }
}

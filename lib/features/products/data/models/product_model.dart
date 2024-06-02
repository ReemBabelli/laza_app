import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/products/data/models/products_model.dart';
import 'package:laza_app/features/products/data/models/review_model.dart';
import 'package:laza_app/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.productId,
    required super.productImages,
    required super.name,
    required super.price,
    required super.description,
    required super.size,
    required super.gender,
    required super.brand,
    required super.createdAt,
    required super.updatedAt,
    super.iV,
    super.id,
     super.reviews
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final images = <ProductImages>[];
    final comments = <ReviewModel>[];
    final sizes = <String>[];

      json[ApiKey.productImages].forEach((v) {
        images.add(ProductImages.fromJson(v));
      });


    if(json[ApiKey.comments] != [] && json[ApiKey.comments] != null ){
      json[ApiKey.comments].forEach((v) {
        comments.add(ReviewModel.fromJson(v));
      });
    }

    json[ApiKey.size].forEach((v) {
      sizes.add(v.toString());
    });

    return ProductModel(
        productImages: images,
        name: json[ApiKey.name],
        price: json[ApiKey.price],
        description: json[ApiKey.description],
        size: sizes,
        gender: json[ApiKey.gender],
        brand: json[ApiKey.brand],
        createdAt: json[ApiKey.createdAt],
        updatedAt: json[ApiKey.updatedAt],
        iV: json[ApiKey.v],
        productId: json[ApiKey.id],
        reviews:comments,
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
      data[ApiKey.productImages] =
          productImages.map((v) => v.toJson()).toList();

    data[ApiKey.name] = name;
    data[ApiKey.price] = price;
    data[ApiKey.description] = description;
    data[ApiKey.size] = size;
    data[ApiKey.gender] = gender;
    data[ApiKey.brand] = brand;
    data[ApiKey.createdAt] = createdAt;
    data[ApiKey.updatedAt] = updatedAt;
    data[ApiKey.v] = iV;
    data[ApiKey.id] = productId;
    return data;
  }
}

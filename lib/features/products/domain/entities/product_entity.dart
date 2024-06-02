import 'package:laza_app/features/products/data/models/products_model.dart';
import 'package:laza_app/features/products/data/models/review_model.dart';

class ProductEntity {
  final String productId;
  List<ProductImages> productImages;
  String name;
  int price;
  String description;
  List<String> size;
  String gender;
  String brand;
  String createdAt;
  String updatedAt;
  int? iV;
  String? id;
  List<ReviewModel>? reviews;


  ProductEntity({
    required this.productId,
    required this.productImages,
    required this.name,
    required this.price,
    required this.description,
    required this.size,
    required this.gender,
    required this.brand,
    required this.createdAt,
    required this.updatedAt,
    this.iV,
    this.id,
     this.reviews,
  });
}

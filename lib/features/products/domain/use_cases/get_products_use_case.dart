import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/products/data/repositories/product_repository_imp.dart';
import 'package:laza_app/features/products/domain/entities/products_entity.dart';
import 'package:laza_app/features/products/domain/repositories/product_repository.dart';

class GetProductsAndBrandsUseCase {
  final ProductRepository repository;

  GetProductsAndBrandsUseCase({required this.repository});

  Future<Either<Failure, ProductsAndBrands>> call(String? brandId) async {
    return await repository.getProductsAndBrands(brandId);
  }
}

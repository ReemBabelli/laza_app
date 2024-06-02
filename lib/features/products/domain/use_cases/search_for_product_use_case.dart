import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/products/data/repositories/product_repository_imp.dart';
import 'package:laza_app/features/products/domain/repositories/product_repository.dart';

import '../entities/products_entity.dart';

class SearchForProductUseCase{
  final ProductRepository repository;

  SearchForProductUseCase({required this.repository});

  Future<Either<Failure,ProductsAndBrands>> call(String productName) async {
    return await repository.searchForProduct(productName);
  }
}
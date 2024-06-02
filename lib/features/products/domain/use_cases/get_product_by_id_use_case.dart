import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/products/data/repositories/product_repository_imp.dart';
import 'package:laza_app/features/products/domain/entities/product_entity.dart';
import 'package:laza_app/features/products/domain/entities/products_entity.dart';
import 'package:laza_app/features/products/domain/repositories/product_repository.dart';

class GetProductByIdUseCase{
  final ProductRepository repository;

  GetProductByIdUseCase({required this.repository});

  Future<Either<Failure,ProductEntity>> call(String id)async{
    return await repository.getProductById(id);
  }

}
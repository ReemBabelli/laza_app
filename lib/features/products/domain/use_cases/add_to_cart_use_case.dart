import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/products/domain/entities/adding_to_cart_entity.dart';
import 'package:laza_app/features/products/domain/repositories/product_repository.dart';

class AddToCartUseCase{
  final ProductRepository repository;

  const AddToCartUseCase({
    required this.repository,
  });

  Future<Either<Failure,AddingToCartEntity>> call(String productId) async {
    return await repository.addToCart(productId);
  }
}
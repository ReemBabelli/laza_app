import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/products/domain/entities/adding_to_wishlist_entity.dart';
import 'package:laza_app/features/products/domain/repositories/product_repository.dart';

class AddToWishListUseCase{
  final ProductRepository repository;

  AddToWishListUseCase({required this.repository});

  Future<Either<Failure,AddingToWishListEntity>> call(String productId) async {
    return await repository.addToWishList(productId);
  }
}
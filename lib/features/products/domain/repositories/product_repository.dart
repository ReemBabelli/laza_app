import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/products/data/repositories/product_repository_imp.dart';
import 'package:laza_app/features/products/domain/entities/adding_review_entity.dart';
import 'package:laza_app/features/products/domain/entities/adding_to_cart_entity.dart';
import 'package:laza_app/features/products/domain/entities/adding_to_wishlist_entity.dart';
import 'package:laza_app/features/products/domain/entities/brands_entity.dart';
import 'package:laza_app/features/products/domain/entities/deleteing_review_entity.dart';
import 'package:laza_app/features/products/domain/entities/product_entity.dart';
import 'package:laza_app/features/products/domain/entities/products_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:laza_app/features/products/domain/entities/review_entity.dart';

abstract class ProductRepository{
  Future<Either<Failure,AddingToCartEntity>> addToCart(String productId);
  Future<Either<Failure,AddingToWishListEntity>> addToWishList(String productId);

  Future<Either<Failure,ProductsAndBrands>> getProductsAndBrands(String? brandId);
  Future<Either<Failure,ProductEntity>> getProductById(String id);
  Future<Either<Failure,ProductsAndBrands>> searchForProduct(String productName);

  Future<Either<Failure,AddingReviewEntity>> addReview(AddingReviewEntity addingReviewEntity);
  Future<Either<Failure,DeletingReviewEntity>> deleteReview(String reviewId);

  Future<Either<Failure,bool>> isExistInComments(String commentId);

}
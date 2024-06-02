import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/exceptions.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/core/network/network_info.dart';
import 'package:laza_app/features/auth/data/data_sources/user_local_data_source.dart';
import 'package:laza_app/features/products/data/data_sources/products_local_data_source.dart';
import 'package:laza_app/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:laza_app/features/products/data/models/adding_review_model.dart';
import 'package:laza_app/features/products/data/models/adding_to_cart_model.dart';
import 'package:laza_app/features/products/data/models/adding_to_wish_list_model.dart';
import 'package:laza_app/features/products/data/models/brands_model.dart';
import 'package:laza_app/features/products/data/models/deleting_review_model.dart';
import 'package:laza_app/features/products/data/models/is_exist_in_comments_model.dart';
import 'package:laza_app/features/products/data/models/products_model.dart';
import 'package:laza_app/features/products/domain/entities/adding_review_entity.dart';
import 'package:laza_app/features/products/domain/entities/adding_to_cart_entity.dart';
import 'package:laza_app/features/products/domain/entities/adding_to_wishlist_entity.dart';
import 'package:laza_app/features/products/domain/entities/deleteing_review_entity.dart';
import 'package:laza_app/features/products/domain/entities/product_entity.dart';
import 'package:laza_app/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final UserLocalDataSource userLocalDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImp(
      {required this.remoteDataSource,
      required this.userLocalDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, ProductEntity>> getProductById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final product = await remoteDataSource.getProductById(id);
        return Right(product);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, ProductsAndBrands>> getProductsAndBrands(
      String? brandId) async {
    if (await networkInfo.isConnected) {
      try {
        final productsModel = await remoteDataSource.getProducts(brandId);
        final brandsModel = await remoteDataSource.getBrands();
        final username = await userLocalDataSource.getUsername();
        final prAndBr = ProductsAndBrands(
            productsModel: productsModel,
            brandsModel: brandsModel,
            username: username);
        return Right(prAndBr);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, AddingReviewEntity>> addReview(
      AddingReviewEntity addingReviewEntity) async {
    if (await networkInfo.isConnected) {
      try {
        final token = await userLocalDataSource.getToken();
        final addingReviewModel = AddingReviewModel(
          token: token,
          productId: addingReviewEntity.productId,
          review: addingReviewEntity.review,
          rating: addingReviewEntity.rating,
        );
        final addingReviewModelResponse =
            await remoteDataSource.addReview(addingReviewModel);
        return Right(addingReviewModelResponse);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, AddingToWishListEntity>> addToWishList(
      String productId) async {
    if (await networkInfo.isConnected) {
      try {
        final token = await userLocalDataSource.getToken();
        final addingToWishListModel =
            AddingToWishListModel(token: token, productId: productId);
        final addingToWishListModelResponse =
            await remoteDataSource.addToWishList(addingToWishListModel);
        // await localDataSource.cacheToWishList(productId);
        return Right(addingToWishListModelResponse);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, AddingToCartEntity>> addToCart(
      String productId) async {
    if (await networkInfo.isConnected) {
      try {
        final token = await userLocalDataSource.getToken();
        final addingToCartModel =
            AddingToCartModel(token: token, productId: productId);
        final response = await remoteDataSource.addToCart(addingToCartModel);
        return Right(response);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, DeletingReviewEntity>> deleteReview(
      String reviewId) async {
    if (await networkInfo.isConnected) {
      try {
        final token = await userLocalDataSource.getToken();
        final deletingModel =
            DeletingReviewModel(token: token, reviewId: reviewId);
        final response = await remoteDataSource.deleteReview(deletingModel);
        return Right(response);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isExistInComments(String commentId) async {
    try {
      String token = await userLocalDataSource.getToken();
      IsExistInCommentsModel isExistInCommentsModel =
          IsExistInCommentsModel(commentId: commentId, token: token);
      bool isExists =
          await remoteDataSource.isExistInComments(isExistInCommentsModel);
      return Right(isExists);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ProductsAndBrands>> searchForProduct(
      String productName) async {
    if (await networkInfo.isConnected) {
      try {
        final products = await remoteDataSource.searchForProduct(productName);
        final username = await userLocalDataSource.getUsername();
        final prAndUser =
            ProductsAndBrands(productsModel: products, username: username);
        return Right(prAndUser);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}

class ProductsAndBrands {
  final ProductsModel productsModel;
  final BrandsModel? brandsModel;
  final String username;

  ProductsAndBrands({
    required this.productsModel,
    this.brandsModel,
    required this.username,
  });
}

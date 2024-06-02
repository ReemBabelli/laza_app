import 'package:dio/dio.dart';
import 'package:laza_app/core/api/api_consumer.dart';
import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/core/errors/error_model.dart';
import 'package:laza_app/core/errors/exceptions.dart';
import 'package:laza_app/features/products/data/models/adding_review_model.dart';
import 'package:laza_app/features/products/data/models/adding_to_cart_model.dart';
import 'package:laza_app/features/products/data/models/adding_to_wish_list_model.dart';
import 'package:laza_app/features/products/data/models/brands_model.dart';
import 'package:laza_app/features/products/data/models/deleting_review_model.dart';
import 'package:laza_app/features/products/data/models/is_exist_in_comments_model.dart';
import 'package:laza_app/features/products/data/models/product_model.dart';
import 'package:laza_app/features/products/data/models/products_model.dart';

abstract class ProductRemoteDataSource {
  Future<AddingToCartModel> addToCart(AddingToCartModel addingToCartModel);

  Future<AddingToWishListModel> addToWishList(
      AddingToWishListModel addingToWishListModel);

  Future<ProductsModel> getProducts(String? brandId);

  Future<ProductModel> getProductById(String id);

  Future<ProductsModel> searchForProduct(String productName);

  Future<BrandsModel> getBrands();

  Future<AddingReviewModel> addReview(AddingReviewModel addingReviewModel);

  Future<DeletingReviewModel> deleteReview(
      DeletingReviewModel deletingReviewModel);

  Future<bool> isExistInComments(IsExistInCommentsModel isExistInCommentsModel);
}

class ProductRemoteDataSourceImp extends ProductRemoteDataSource {
  final ApiConsumer api;

  ProductRemoteDataSourceImp({required this.api});

  @override
  Future<ProductsModel> getProducts(String? brandId) async {
    try {
      Response response = await api
          .get(EndPoints.getProduct, queryParams: {"brandId": brandId});
      ProductsModel productsModelResponse =
          ProductsModel.fromJson(response.data);
      return productsModelResponse;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    try {
      Response response = await api.get("${EndPoints.getProduct}$id");
      ProductModel productModel = ProductModel.fromJson(response.data);
      return productModel;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<BrandsModel> getBrands() async {
    try {
      Response response = await api.get(EndPoints.getBrands);
      BrandsModel brandsModel = BrandsModel.fromJson(response.data);
      return brandsModel;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<AddingReviewModel> addReview(
      AddingReviewModel addingReviewModel) async {
    try {
      Response response = await api.post(EndPoints.review,
          data: {
            ApiKey.productId: addingReviewModel.productId,
            ApiKey.review: addingReviewModel.review,
            ApiKey.rating: addingReviewModel.rating
          },
          token: addingReviewModel.token);
      AddingReviewModel addingReviewModelResponse =
          AddingReviewModel.fromJson(response.data);
      return addingReviewModelResponse;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<AddingToWishListModel> addToWishList(
      AddingToWishListModel addingToWishListModel) async {
    try {
      Response response = await api.post(EndPoints.addingToWishList,
          data: {ApiKey.wishList: addingToWishListModel.productId},
          token: addingToWishListModel.token);
      AddingToWishListModel responseModel =
          AddingToWishListModel.fromJson(response.data);
      return responseModel;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<AddingToCartModel> addToCart(
      AddingToCartModel addingToCartModel) async {
    try {
      Response response = await api.post(EndPoints.cart,
          data: {ApiKey.cartAdd: addingToCartModel.productId},
          token: addingToCartModel.token);
      final responseModel = AddingToCartModel.fromJson(response.data);
      return responseModel;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<DeletingReviewModel> deleteReview(
      DeletingReviewModel deletingReviewModel) async {
    try {
      Response response = await api.delete(
          "${EndPoints.review}${deletingReviewModel.reviewId}",
          token: deletingReviewModel.token);
      DeletingReviewModel responseModel =
          DeletingReviewModel.fromJson(response.data);
      if (response.statusCode == 403) {
        ErrorModel errorModel =
            ErrorModel(errorMessage: responseModel.message!);
        throw ServerException(errorModel: errorModel);
      }
      return responseModel;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<bool> isExistInComments(IsExistInCommentsModel isExistInCommentsModel) async {
    try {
      Response response = await api.post(EndPoints.isExistInReviews,
          data: {ApiKey.commentHave: isExistInCommentsModel.commentId},
          token: isExistInCommentsModel.token);
      final responseModel = IsExistInCommentsModel.fromJson(response.data);
      if (responseModel.message == "The comment was found") {
        return true;
      }
      return false;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<ProductsModel> searchForProduct(String productName) async {
   try{
     Response response =await api.get(EndPoints.getProduct,queryParams: {"productName":productName});
     final products = ProductsModel.fromJson(response.data);
     return products;
   }on ServerException catch (e) {
     throw ServerException(errorModel: e.errorModel);
   }
  }
}

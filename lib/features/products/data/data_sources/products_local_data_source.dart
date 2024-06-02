import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/exceptions.dart';
import 'package:laza_app/features/products/data/models/brand_model.dart';
import 'package:laza_app/features/products/data/models/brands_model.dart';
import 'package:laza_app/features/products/data/models/product_model.dart';
import 'package:laza_app/features/products/data/models/products_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<Unit> cacheProducts(ProductsModel productsModel);

  Future<List<ProductModel>> getProducts();

  Future<Unit> cacheBrands(BrandsModel brandsModel);

  Future<List<BrandModel>> getBrands();

  // Future<Unit> cacheToWishList(String productId);
  //
  // Future<List<String>> getWishList();
  //
  // Future<Unit> removeFromWishList(String productId);
}

class ProductLocalDataSourceImp implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cacheBrands(BrandsModel brandsModel) async {
    final brandsToJson = brandsModel.brands!
        .map<Map<String, dynamic>>((brand) => brand.toJson())
        .toList();
    await sharedPreferences.setString("brands", jsonEncode(brandsToJson));
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheProducts(ProductsModel productsModel) async {
    final productsToJson = productsModel.products!
        .map<Map<String, dynamic>>((product) => product.toJson())
        .toList();
    await sharedPreferences.setString("products", jsonEncode(productsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<BrandModel>> getBrands() async {
    final brandsString = sharedPreferences.getString("brands");
    if (brandsString != null) {
      final brandsFromJson = jsonDecode(brandsString);
      final brandsModel = brandsFromJson
          .map<BrandModel>((brand) => BrandModel.fromJson(brand))
          .toList();
      return Future.value(brandsModel);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final productsString = sharedPreferences.getString("products");
    if (productsString != null) {
      final productsFromJson = jsonDecode(productsString);
      final productsModel = productsFromJson
          .map<BrandModel>((brand) => BrandModel.fromJson(brand))
          .toList();
      return Future.value(productsModel);
    } else {
      throw EmptyCacheException();
    }
  }

  // @override
  // Future<Unit> cacheToWishList(String productId) async {
  //   List<String> wishList =await  getWishList();
  //  wishList.add(productId);
  //  sharedPreferences.setStringList("wishList", wishList);
  //  return Future.value(unit);
  // }
  //
  // @override
  // Future<List<String>> getWishList() async {
  //
  //  if(sharedPreferences.getStringList("wishList") == null){
  //    sharedPreferences.setStringList("wishList", []);
  //    List<String> wishList = sharedPreferences.getStringList("wishList")!;
  //    return Future.value(wishList);
  //  }else{
  //    List<String> wishList = sharedPreferences.getStringList("wishList")!;
  //    return Future.value(wishList);
  //  }
  //
  // }
  //
  // @override
  // Future<Unit> removeFromWishList(String productId) async {
  //
  //
  //
  // }
}

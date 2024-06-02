part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState{}

class ProductErrorState extends ProductState{
  final String errMessage;

  ProductErrorState({required this.errMessage});
}

class ProductDetailsErrorState extends ProductState{
  final String errMessage;

  ProductDetailsErrorState({required this.errMessage});
}

//product & brands//////////////////////////////////////////////////////////////

class ProductAndBrandsSuccessState extends ProductState{
  final ProductsAndBrands productsAndBrands;

  ProductAndBrandsSuccessState({required this.productsAndBrands});
}
class ProductsByBrandIdSuccessState extends ProductState{
  final String brandImg;
 final ProductsEntity productsEntity;

  ProductsByBrandIdSuccessState({required this.productsEntity, required this.brandImg});
}

class ProductDetailsSuccessState extends ProductState{
  final ProductEntity productEntity;
  // final bool isAddedToWishList;

  ProductDetailsSuccessState({required this.productEntity});
}

class SuccessState extends ProductState{
  final String sucMessage;

  SuccessState({required this.sucMessage});
}
//reviews///////////////////////////////////////////////////////////////////////

class AddingReviewSuccessState extends ProductState{
  final AddingReviewEntity addingReviewEntity;

  AddingReviewSuccessState({required this.addingReviewEntity});
}

//profile///////////////////////////////////////////////////////////////////////

class IsExistInCartState extends ProductState{
  final bool isExists;

  IsExistInCartState({required this.isExists});
}

class IsExistInWishlistState extends ProductState{
  final bool isExists;

  IsExistInWishlistState({required this.isExists});
}

class IsExistInCommentsState extends ProductState{
  final bool isExists;

  IsExistInCommentsState({required this.isExists});
}
//search////////////////////////////////////////////////////////////////////////

class GetProductsByNameState extends ProductState{
  final ProductsAndBrands proAndUser;

  GetProductsByNameState({required this.proAndUser});
}
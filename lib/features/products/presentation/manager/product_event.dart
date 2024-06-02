part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class GetProductsAndBrandsEvent extends ProductEvent {
  final String? brandId;
  final String? brandImage;

  GetProductsAndBrandsEvent({ this.brandId,  this.brandImage});
}

class GetProductByIdEvent extends ProductEvent{
  final String productId;

  GetProductByIdEvent({required this.productId});
}

class AddReviewEvent extends ProductEvent{
  final AddingReviewEntity addingReviewEntity;

  AddReviewEvent({required this.addingReviewEntity});
}

class AddToWishListEvent  extends ProductEvent{
  final String productId;

  AddToWishListEvent({required this.productId});
}

class AddToCartEvent  extends ProductEvent{
  final String productId;

  AddToCartEvent({required this.productId});
}

class IsExistInCartEvent extends ProductEvent{
  final String productId;

  IsExistInCartEvent({required this.productId});
}

class IsExistInWishlistEvent extends ProductEvent{
  final String productId;

  IsExistInWishlistEvent({required this.productId});
}

class DeletingReviewEvent extends ProductEvent{
  final String reviewId;

  DeletingReviewEvent({required this.reviewId});
}

class IsExistInCommentsEvent extends ProductEvent{
  final String commentId;

  IsExistInCommentsEvent({required this.commentId});
}

class SearchEvent extends ProductEvent{
  final String productName;

  SearchEvent({required this.productName});
}
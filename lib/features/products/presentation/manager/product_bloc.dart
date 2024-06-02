import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/auth/domain/use_cases/is_exist_in_cart_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/is_exist_in_comments_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/is_exist_in_wishlist_use_case.dart';
import 'package:laza_app/features/products/data/repositories/product_repository_imp.dart';
import 'package:laza_app/features/products/domain/entities/adding_review_entity.dart';
import 'package:laza_app/features/products/domain/entities/adding_to_cart_entity.dart';
import 'package:laza_app/features/products/domain/entities/adding_to_wishlist_entity.dart';
import 'package:laza_app/features/products/domain/entities/deleteing_review_entity.dart';
import 'package:laza_app/features/products/domain/entities/product_entity.dart';
import 'package:laza_app/features/products/domain/entities/products_entity.dart';
import 'package:laza_app/features/products/domain/use_cases/add_review_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/add_to_cart_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/add_to_wish_list_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/delete_review_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/search_for_product_use_case.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductByIdUseCase getProductByIdUseCase;
  final GetProductsAndBrandsUseCase getProductsAndBrandsUseCase;
  final AddReviewUseCase addReviewUseCase;
  final AddToWishListUseCase addToWishListUseCase;
  final AddToCartUseCase addToCartUseCase;
  final IsExistInCartUseCase isExistInCartUseCase;
  final IsExistInWishlistUseCase isExistInWishlistUseCase;
  final DeleteReviewUseCase deleteReviewUseCase;
  final IsExistInCommentsUseCase isExistInCommentsUseCase;
  final SearchForProductUseCase searchForProductUseCase;

  ProductBloc({
    required this.getProductByIdUseCase,
    required this.getProductsAndBrandsUseCase,
    required this.addReviewUseCase,
    required this.addToWishListUseCase,
    required this.addToCartUseCase,
    required this.isExistInCartUseCase,
    required this.isExistInWishlistUseCase,
    required this.deleteReviewUseCase,
    required this.isExistInCommentsUseCase,
    required this.searchForProductUseCase
  }) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {

      if (event is GetProductsAndBrandsEvent) {
        emit(ProductLoadingState());
        final failureOrProductsAndBrands =
            await getProductsAndBrandsUseCase(event.brandId);


        if (event.brandId == null) {
          emit(_fold1(failureOrProductsAndBrands));
        } else {
          final brandImg = event.brandImage;
          emit(_fold2(failureOrProductsAndBrands, brandImg!));
        }
      }

      else if (event is GetProductByIdEvent) {
        emit(ProductLoadingState());
        final failureOrDetails = await getProductByIdUseCase(event.productId);
        emit(_fold3(failureOrDetails));
      }

      else if (event is AddReviewEvent) {
        emit(ProductLoadingState());
        final failureOrSuc = await addReviewUseCase(event.addingReviewEntity);
        emit(_fold4(failureOrSuc));
      }

      else if (event is AddToWishListEvent) {
        final failureOrSuc = await addToWishListUseCase(event.productId);
        emit(_fold5(failureOrSuc));
      }

      else if(event is AddToCartEvent){
        final failureOrSuc = await addToCartUseCase(event.productId);
        emit(_fold6(failureOrSuc));
      }

      else if (event is IsExistInCartEvent) {
        final failureOrBool = await isExistInCartUseCase(event.productId);
        emit(_fold7(failureOrBool));
      }


      else if (event is IsExistInWishlistEvent) {
        final failureOrBool = await isExistInWishlistUseCase(event.productId);
        emit(_fold8(failureOrBool));
      }

      else if (event is IsExistInCommentsEvent) {
        final failureOrBool = await isExistInCommentsUseCase(event.commentId);
        emit(_fold10(failureOrBool));
      }

      else if (event is DeletingReviewEvent) {
        final failureOrSuc = await deleteReviewUseCase(event.reviewId);
        emit(_fold9(failureOrSuc));
      }

      else if (event is SearchEvent) {
        emit(ProductLoadingState());
        final failureOrProducts = await searchForProductUseCase(event.productName);
        emit(_fold11(failureOrProducts));
      }
    });
  }




}

ProductState _fold1(Either<Failure, ProductsAndBrands> failureOrProducts) {
  return failureOrProducts.fold(
      (failure) => ProductErrorState(errMessage: failure.errMessage),
      (productsAndBrands) =>
          ProductAndBrandsSuccessState(productsAndBrands: productsAndBrands));
}

ProductState _fold2(
    Either<Failure, ProductsAndBrands> failureOrProducts, String brandImg) {
  return failureOrProducts.fold(
      (failure) => ProductErrorState(errMessage: failure.errMessage),
      (productsAndBrands) => ProductsByBrandIdSuccessState(
          productsEntity: productsAndBrands.productsModel, brandImg: brandImg));
}

ProductState _fold3(Either<Failure, ProductEntity> failureOrDetails) {
  return failureOrDetails.fold(
      (failure) => ProductErrorState(errMessage: failure.errMessage ),
      (product) => ProductDetailsSuccessState(
          productEntity: product,));
}

ProductState _fold4(Either<Failure, AddingReviewEntity> failureOrSuc) {
  return failureOrSuc.fold(
      (failure) => ProductErrorState(errMessage: failure.errMessage),
      (addingReviewEntity) =>
          AddingReviewSuccessState(addingReviewEntity: addingReviewEntity));
}

ProductState _fold5(Either<Failure, AddingToWishListEntity> failureOrSuc) {
  return failureOrSuc.fold(
      (failure) => ProductErrorState(errMessage: failure.errMessage),
      (addingEntity) => SuccessState(sucMessage: addingEntity.message!));
}

ProductState _fold6(Either<Failure, AddingToCartEntity> failureOrSuc) {
  return failureOrSuc.fold(
          (failure) => ProductErrorState(errMessage: failure.errMessage),
          (addingEntity) => SuccessState(sucMessage: addingEntity.message!));
}

ProductState _fold7(Either<Failure, bool> failureOrBool) {
  return failureOrBool.fold(
          (failure) => ProductErrorState(errMessage: failure.errMessage),
          (r) => IsExistInCartState(isExists: r));
}

ProductState _fold8(Either<Failure, bool> failureOrBool) {
  return failureOrBool.fold(
          (failure) => ProductErrorState(errMessage: failure.errMessage),
          (r) => IsExistInWishlistState(isExists: r));
}

ProductState _fold9(Either<Failure, DeletingReviewEntity> failureOrSuc) {
  return failureOrSuc.fold(
          (failure) => ProductErrorState(errMessage: failure.errMessage),
          (deletingEntity) => SuccessState(sucMessage: deletingEntity.message!));
}

ProductState _fold10(Either<Failure, bool> failureOrBool) {
  return failureOrBool.fold(
          (failure) => ProductErrorState(errMessage: failure.errMessage),
          (r) => IsExistInCommentsState(isExists: r));
}

ProductState _fold11(Either<Failure, ProductsAndBrands> failureOrProducts) {
  return failureOrProducts.fold(
          (failure) =>  ProductErrorState(errMessage: failure.errMessage),
          (prAndUser) => GetProductsByNameState(proAndUser: prAndUser)
  );
}
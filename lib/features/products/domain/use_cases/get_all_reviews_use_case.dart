// import 'package:dartz/dartz.dart';
// import 'package:laza_app/core/errors/failures.dart';
// import 'package:laza_app/features/products/domain/entities/review_entity.dart';
// import 'package:laza_app/features/products/domain/repositories/product_repository.dart';
//
// class GetAllReviewsUseCase{
//   final ProductRepository repository;
//
//   GetAllReviewsUseCase({required this.repository});
//
//   Future<Either<Failure,List<ReviewEntity>>> call(String productId) async{
//     return await repository.getAllReviews(productId);
//   }
// }
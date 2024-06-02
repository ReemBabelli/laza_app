import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/products/domain/entities/deleteing_review_entity.dart';
import 'package:laza_app/features/products/domain/repositories/product_repository.dart';

class DeleteReviewUseCase{
  final ProductRepository repository;

  DeleteReviewUseCase({required this.repository});

  Future<Either<Failure,DeletingReviewEntity>> call(String reviewId) async{
    return await repository.deleteReview(reviewId);
  }
}
import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/products/domain/entities/adding_review_entity.dart';
import 'package:laza_app/features/products/domain/repositories/product_repository.dart';

class AddReviewUseCase{
  final ProductRepository repository;

  AddReviewUseCase({required this.repository});

  Future<Either<Failure,AddingReviewEntity>> call(AddingReviewEntity addingReviewEntity) async {
    return await repository.addReview(addingReviewEntity);
  }
}
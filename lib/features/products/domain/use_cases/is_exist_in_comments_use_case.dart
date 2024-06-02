import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/auth/domain/entities/is_exist_in_cart_entity.dart';
import 'package:laza_app/features/auth/domain/repositories/user_repository.dart';
import 'package:laza_app/features/products/domain/repositories/product_repository.dart';

class IsExistInCommentsUseCase{
  final ProductRepository repository;

  IsExistInCommentsUseCase({required this.repository});

  Future<Either<Failure,bool>> call(String commentId) async {
    return await repository.isExistInComments(commentId);
  }
}
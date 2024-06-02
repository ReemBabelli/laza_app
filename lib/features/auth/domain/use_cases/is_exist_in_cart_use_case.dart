import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/auth/domain/entities/is_exist_in_cart_entity.dart';
import 'package:laza_app/features/auth/domain/repositories/user_repository.dart';

class IsExistInCartUseCase{
  final UserRepository repository;

  IsExistInCartUseCase({required this.repository});

  Future<Either<Failure,bool>> call(String productId) async {
    return await repository.isExistInCart(productId);
  }
}
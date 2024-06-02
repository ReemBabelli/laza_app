import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/auth/domain/entities/user_entity.dart';
import 'package:laza_app/features/auth/domain/repositories/user_repository.dart';

class GetProfileUseCase{
  final UserRepository repository;

  GetProfileUseCase({required this.repository});

  Future<Either<Failure,UserEntity>> call() async {
    return await repository.getProfile();
  }
}
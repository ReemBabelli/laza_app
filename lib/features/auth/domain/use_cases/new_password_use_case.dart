import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/auth/domain/entities/new_password_entity.dart';
import 'package:laza_app/features/auth/domain/repositories/user_repository.dart';

class NewPasswordUseCase{
  final UserRepository repository;

  NewPasswordUseCase({required this.repository});

  Future<Either<Failure,String>> call(NewPasswordEntity newPasswordEntity) async{
    return await repository.resetPassword(newPasswordEntity);
  }

}
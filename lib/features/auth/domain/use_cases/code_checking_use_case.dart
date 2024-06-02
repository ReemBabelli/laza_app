import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/auth/domain/entities/code_checking_entity.dart';
import 'package:laza_app/features/auth/domain/repositories/user_repository.dart';

class CodeCheckingUseCase {
  final UserRepository repository;

  CodeCheckingUseCase({required this.repository});

  Future<Either<Failure, String>> call(
      CodeCheckingEntity codeCheckingEntity) async {
    return await repository.checkCode(codeCheckingEntity);
  }
}

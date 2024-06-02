import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laza_app/features/auth/domain/entities/signup_entity.dart';
import 'package:laza_app/features/auth/domain/repositories/user_repository.dart';

import '../../../../core/errors/failures.dart';

@lazySingleton
class SignUpUseCase {
  final UserRepository repository;

  SignUpUseCase({required this.repository});

  Future<Either<Failure, String>> call(SignupEntity signupEntity) async {
    return await repository.signUp(signupEntity);
  }
}

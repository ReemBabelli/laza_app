import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laza_app/features/auth/domain/entities/signin_entity.dart';
import 'package:laza_app/features/auth/domain/repositories/user_repository.dart';
import '../../../../core/errors/failures.dart';

@lazySingleton
class SignInWithEmailUseCase {
  final UserRepository repository;

  SignInWithEmailUseCase({required this.repository});

  Future<Either<Failure, String>> call(SignInEntity signInEntity) async {
    return await repository.signInWithEmail(signInEntity);
  }
}

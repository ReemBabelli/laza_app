import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laza_app/features/auth/domain/repositories/user_repository.dart';

import '../../../../core/errors/failures.dart';

@lazySingleton
class SignOutUseCase{
  final UserRepository repository;

  SignOutUseCase({required this.repository});

  Future<Either<Failure,String>> call() async {
    return await repository.signOut();
  }
}
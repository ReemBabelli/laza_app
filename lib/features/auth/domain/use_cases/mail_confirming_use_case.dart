import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/auth/domain/entities/mail_confirming _entity.dart';
import 'package:laza_app/features/auth/domain/entities/user_entity.dart';
import 'package:laza_app/features/auth/domain/repositories/user_repository.dart';

class ConfirmMailUseCase{
  final UserRepository repository;

  ConfirmMailUseCase({required this.repository});

  Future<Either<Failure,String>> call(MailConfirmingEntity confirmMailEntity)async{
    return await repository.confirmMail(confirmMailEntity);
  }
}
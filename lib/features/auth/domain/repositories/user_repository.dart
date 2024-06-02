import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failures.dart';
import 'package:laza_app/features/auth/domain/entities/code_checking_entity.dart';
import 'package:laza_app/features/auth/domain/entities/is_exist_in_cart_entity.dart';
import 'package:laza_app/features/auth/domain/entities/mail_confirming _entity.dart';
import 'package:laza_app/features/auth/domain/entities/new_password_entity.dart';
import 'package:laza_app/features/auth/domain/entities/signin_entity.dart';
import 'package:laza_app/features/auth/domain/entities/signup_entity.dart';
import 'package:laza_app/features/auth/domain/entities/user_entity.dart';

abstract class UserRepository{
  Future<Either<Failure,String>> signUp(SignupEntity signupEntity);
   Future<Either<Failure,String>> signInWithEmail(SignInEntity signInEntity);
  Future<Either<Failure,String>> signOut();
  // Future<Either<Failure,bool>> isLoggedIn();

  Future<Either<Failure,String>> confirmMail(MailConfirmingEntity confirmMailEntity);
  Future<Either<Failure,String>> checkCode(CodeCheckingEntity codeCheckingEntity);
  Future<Either<Failure,String>> resetPassword(NewPasswordEntity newPasswordEntity);

  Future<Either<Failure,UserEntity>> getProfile();
  Future<Either<Failure,bool>> isExistInCart(String productId);
  Future<Either<Failure,bool>> isExistInWishList(String productId);

}
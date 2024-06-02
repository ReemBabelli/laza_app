import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laza_app/core/network/network_info.dart';
import 'package:laza_app/features/auth/data/data_sources/user_local_data_source.dart';
import 'package:laza_app/features/auth/data/models/code_checking_model.dart';
import 'package:laza_app/features/auth/data/models/is_exist_in_cart_model.dart';
import 'package:laza_app/features/auth/data/models/is_exist_in_wishlist_model.dart';
import 'package:laza_app/features/auth/data/models/mail_confirming_model.dart';
import 'package:laza_app/features/auth/data/models/new_password_model.dart';
import 'package:laza_app/features/auth/data/models/signin_model.dart';
import 'package:laza_app/features/auth/data/models/signup_model.dart';
import 'package:laza_app/features/auth/domain/entities/code_checking_entity.dart';
import 'package:laza_app/features/auth/domain/entities/mail_confirming _entity.dart';
import 'package:laza_app/features/auth/domain/entities/new_password_entity.dart';
import 'package:laza_app/features/auth/domain/entities/signin_entity.dart';
import 'package:laza_app/features/auth/domain/entities/signup_entity.dart';
import 'package:laza_app/features/auth/domain/entities/user_entity.dart';
import 'package:laza_app/features/auth/domain/repositories/user_repository.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../data_sources/user_remote_data_source.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImp implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImp(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, String>> signOut() async {
    if (await localDataSource.isLoggedIn()) {
      String token = await localDataSource.getToken();
      localDataSource.removeToken(token);
      localDataSource.setLoggedIn(false);
      return const Right("logged out");
    }
    return left(ServerFailure(errMessage: "you ara already logged out"));
  }

  // @override
  // Future<Either<Failure, bool>> isLoggedIn() {
  //   // TODO: implement isLoggedIn
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<Failure, String>> signUp(SignupEntity signupEntity) async {
    if (await networkInfo.isConnected) {
      try {
        SignupModel signupModel = SignupModel(
            email: signupEntity.email,
            password: signupEntity.password,
            username: signupEntity.username);
        final response = await remoteDataSource.signUpWithEmail(signupModel);
        localDataSource.cacheId(response.id!);
        localDataSource.cacheUsername(response.username!);
        return const Right("You are registered successfully ");
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> signInWithEmail(
      SignInEntity signInEntity) async {
    if (await networkInfo.isConnected) {
      try {
        SignInModel signInModel = SignInModel(
            email: signInEntity.email, password: signInEntity.password);
        SignInEntity response =
            await remoteDataSource.signInWithEmail(signInModel);
        localDataSource.cacheId(response.user!.id!);
        localDataSource.cacheUsername(response.user!.username!);
        //final id = await localDataSource.getId();
        await localDataSource.cacheToken(response.user!.token!);
        localDataSource.setLoggedIn(true);
        return Right(response.user!.username!);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> confirmMail(
      MailConfirmingEntity confirmMailEntity) async {
    if (await networkInfo.isConnected) {
      try {
        ConfirmMailModel confirmMailModel =
            ConfirmMailModel(email: confirmMailEntity.email);
        final response = await remoteDataSource.confirmMail(confirmMailModel);
        return Right(response);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> checkCode(
      CodeCheckingEntity codeCheckingEntity) async {
    if (await networkInfo.isConnected) {
      try {
        String id = await localDataSource.getId();
        CodeCheckingModel codeCheckingModel =
            CodeCheckingModel(verCode: codeCheckingEntity.verCode, id: id);
        final response = await remoteDataSource.checkCode(codeCheckingModel);
        return Right(response);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(
      NewPasswordEntity newPasswordEntity) async {
    if (await networkInfo.isConnected) {
      try {
        String id = await localDataSource.getId();
        NewPasswordModel newPasswordModel = NewPasswordModel(
            newPassword: newPasswordEntity.newPassword,
            confirmedPassword: newPasswordEntity.confirmedPassword,
            id: id);
        await remoteDataSource.resetPassword(newPasswordModel);
        final username = await localDataSource.getUsername();
        return Right(username);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final userId = await localDataSource.getId();
        final user = await remoteDataSource.getProfile(userId);
        return Right(user);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isExistInCart(String productId) async {
    try {
      String token = await localDataSource.getToken();
      IsExistInCartModel isExistInCartModel =
          IsExistInCartModel(productId: productId, token: token);
      bool isExists = await remoteDataSource.isExistInCart(isExistInCartModel);
      return Right(isExists);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> isExistInWishList(String productId) async {
    try {
      String token = await localDataSource.getToken();
      IsExistInWishlistModel isExistInWishlistModel =
          IsExistInWishlistModel(productId: productId, token: token);
      bool isExists =
          await remoteDataSource.isExistInWishlist(isExistInWishlistModel);
      return Right(isExists);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
    }
  }


}

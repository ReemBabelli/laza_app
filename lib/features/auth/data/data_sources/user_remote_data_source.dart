import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:laza_app/core/api/api_consumer.dart';
import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/core/errors/exceptions.dart';
import 'package:laza_app/features/auth/data/models/code_checking_model.dart';
import 'package:laza_app/features/auth/data/models/is_exist_in_cart_model.dart';
import 'package:laza_app/features/products/data/models/is_exist_in_comments_model.dart';
import 'package:laza_app/features/auth/data/models/is_exist_in_wishlist_model.dart';
import 'package:laza_app/features/auth/data/models/mail_confirming_model.dart';
import 'package:laza_app/features/auth/data/models/new_password_model.dart';
import 'package:laza_app/features/auth/data/models/signin_model.dart';
import 'package:laza_app/features/auth/data/models/signup_model.dart';
import 'package:laza_app/features/auth/data/models/user_model.dart';
import 'package:laza_app/features/auth/domain/entities/signin_entity.dart';
import 'package:laza_app/features/auth/domain/entities/signup_entity.dart';

abstract class UserRemoteDataSource {
  Future<SignupEntity> signUpWithEmail(SignupModel signupModel);

  Future<SignInEntity> signInWithEmail(SignInModel signInModel);

  Future<String> confirmMail(ConfirmMailModel confirmMailModel);

  Future<String> checkCode(CodeCheckingModel codeCheckingModel);

  Future<String> resetPassword(NewPasswordModel newPasswordModel);

  Future<UserModel> getProfile(String userId);

  Future<bool> isExistInCart(IsExistInCartModel isExistInCartModel);

  Future<bool> isExistInWishlist(IsExistInWishlistModel isExistInWishlistModel);


}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImp implements UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSourceImp({required this.api});

  @override
  Future<SignupEntity> signUpWithEmail(SignupModel signupModel) async {
    try {
      final response = await api.post(EndPoints.signUp, data: {
        ApiKey.username: signupModel.username,
        ApiKey.email: signupModel.email,
        ApiKey.password: signupModel.password
      });
      final signupModelResponse = SignupModel.fromJson(response.data);
      return signupModelResponse;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<SignInEntity> signInWithEmail(SignInModel signInModel) async {
    try {
      final response = await api.post(EndPoints.signIn, data: {
        ApiKey.email: signInModel.email,
        ApiKey.password: signInModel.password,
      });
      final signInModelResponse = SignInModel.fromJson(response.data);
      return signInModelResponse;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<String> confirmMail(ConfirmMailModel confirmMailModel) async {
    try {
      Response response = await api.post(EndPoints.confirmMail,
          data: {ApiKey.email: confirmMailModel.email});
      return response.statusCode!.toString();
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<String> checkCode(CodeCheckingModel codeCheckingModel) async {
    try {
      Response response = await api.post(
          "${EndPoints.checkCode}${codeCheckingModel.id}",
          data: {ApiKey.verCode: codeCheckingModel.verCode});
      // CodeCheckingModel codeCheckingModelResponse =
      //     CodeCheckingModel.fromJson(response.data);
      return response.statusCode.toString();
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<String> resetPassword(NewPasswordModel newPasswordModel) async {
    try {
      Response response = await api
          .post("${EndPoints.resetPassword}${newPasswordModel.id}", data: {
        ApiKey.password: newPasswordModel.newPassword,
        ApiKey.confirmPassword: newPasswordModel.confirmedPassword
      });
      return response.statusCode.toString();
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<UserModel> getProfile(String userId) async {
    try {
      Response response = await api.get("${EndPoints.profile}$userId");
      final responseModel = UserModel.fromJson(response.data);
      return responseModel;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<bool> isExistInCart(IsExistInCartModel isExistInCartModel) async {
    try {
      Response response = await api.post(EndPoints.isExistInCart,
          data: {ApiKey.checkHave: isExistInCartModel.productId},
          token: isExistInCartModel.token);
      final responseModel = IsExistInCartModel.fromJson(response.data);
      if (responseModel.message == "the product found") {
        return true;
      }
      return false;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<bool> isExistInWishlist(IsExistInWishlistModel isExistInWishlistModel) async {
    try {
      Response response = await api.post(EndPoints.isExistInWishlist,
          data: {ApiKey.wishHave: isExistInWishlistModel.productId},
          token: isExistInWishlistModel.token);
      final responseModel = IsExistInWishlistModel.fromJson(response.data);
      if (responseModel.message == "the product found in wishList") {
        return true;
      }
      return false;
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }


}

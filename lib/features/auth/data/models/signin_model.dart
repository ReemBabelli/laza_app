import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/auth/domain/entities/signin_entity.dart';

import 'user_model.dart';

class SignInModel extends SignInEntity {
  final String? message;


  const SignInModel({this.message, super.user, super.email, super.password});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
        message: json[ApiKey.message],
        user: UserModel.fromJson(json[ApiKey.user]));
  }

  Map<String, dynamic> toJson() {
    return {
      //ApiKey.message: message,
      //ApiKey.user: user!.toJson(),
      ApiKey.email: email,
      ApiKey.password: password,
    };
  }
}

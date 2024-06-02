import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/auth/domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  String? role;
  String? verCode;
  bool? resetPassword;
  int? v;
  List? favouriteP;

  SignupModel({
    super.email,
    super.username,
    super.password,
    super.id,
    this.role,
    this.verCode,
    this.resetPassword,
    this.v,
    this.favouriteP,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      email: json[ApiKey.email],
      username: json[ApiKey.username],
      password: json[ApiKey.password],
      role: json[ApiKey.role],
      verCode: json[ApiKey.verCode],
      resetPassword: json[ApiKey.resetPassword],
      id: json[ApiKey.id],
      v: json[ApiKey.v],
      favouriteP: json[ApiKey.favouriteP],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.email: email,
      ApiKey.username: username,
      ApiKey.password: password,
      // ApiKey.role: role,
      // ApiKey.verCode: verCode,
      // ApiKey.resetPassword: resetPassword,
      // ApiKey.id: id,
      // ApiKey.v: v,
      // ApiKey.favouriteP: favouriteP,
    };
  }
}

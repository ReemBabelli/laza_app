import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/auth/domain/entities/new_password_entity.dart';

class NewPasswordModel extends NewPasswordEntity {
  final String? message;
  final String? id;

  NewPasswordModel(
      { super.newPassword,
       super.confirmedPassword,
      this.message,
      this.id});

  factory NewPasswordModel.fromJson(Map<String, dynamic> json) {
    return NewPasswordModel(
        message: json[ApiKey.message]);
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.password: newPassword,
      ApiKey.confirmPassword: confirmedPassword,
    };
  }
}

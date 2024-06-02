import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/auth/domain/entities/code_checking_entity.dart';

class CodeCheckingModel extends CodeCheckingEntity {
  final String? message;
  final String? id;
  CodeCheckingModel({super.verCode, this.id,  this.message});

  factory CodeCheckingModel.fromJson(Map<String, dynamic> json) {
    return CodeCheckingModel(message: json[ApiKey.message]);
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.message: message,
      ApiKey.id: id,
    };
  }
}

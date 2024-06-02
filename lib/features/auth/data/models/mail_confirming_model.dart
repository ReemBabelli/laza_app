import 'package:laza_app/core/api/end_points.dart';
import 'package:laza_app/features/auth/domain/entities/mail_confirming _entity.dart';

class ConfirmMailModel extends MailConfirmingEntity{
  ConfirmMailModel({required super.email});

  // factory ConfirmMailModel.fromJson(Map<String,dynamic> json){
  //   return ConfirmMailModel(email: ApiKey.email);
  // }
Map<String,dynamic> toJson(){
  return {
    ApiKey.email:email
  };
}
}
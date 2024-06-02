
import 'package:laza_app/core/api/end_points.dart';

class ErrorModel{

  final String errorMessage;

  ErrorModel({required this.errorMessage});

  factory ErrorModel.fromJson(Map<String,dynamic> json){
    return ErrorModel( errorMessage: json[ApiKey.errMessage]);
  }


}
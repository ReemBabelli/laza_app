import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  final String? email;
  final String? username;
  final String? password;
  final String? id;
  // final String? role;
  // final String? verCode;
  // final bool? resetPassword;
  // final int? v;
  // final List? favouriteP;

  SignupEntity(
      {required this.email,
      required this.username,
      required this.password,
         this.id,
      // required this.role,
      // required this.verCode,
      // required this.resetPassword,
      // required this.v,
      // required this.favouriteP,
      });

  @override
  // TODO: implement props
  List<Object?> get props => [email,username,password,id];
}

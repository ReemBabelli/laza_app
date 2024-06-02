
import 'package:equatable/equatable.dart';
import 'package:laza_app/features/auth/data/models/user_model.dart';

class SignInEntity extends Equatable {
  //final UserModel user;
  final String? email;
  final String? password;
  final UserModel? user;

  const SignInEntity({ this.password, this.email,this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
}

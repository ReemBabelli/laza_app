import 'package:laza_app/features/auth/domain/entities/user_entity.dart';

class AuthState {
  AuthState init() {
    return AuthState();
  }

}
class InitialState extends AuthState{}

class AuthLoadingState extends AuthState{}

class AuthErrorState extends AuthState{
  final String errMessage;

  AuthErrorState({required this.errMessage});
}

class AuthSuccessState extends AuthState{
  final String sucMessage;

  AuthSuccessState({required this.sucMessage});
}
class AuthSignUpSuccessState extends AuthState{
  final String sucMessage;

  AuthSignUpSuccessState({required this.sucMessage});
}

class AuthSignInSuccessState extends AuthState{
  final String username;

  AuthSignInSuccessState({required this.username});
}

class GettingProfileSuccessState extends AuthState{
  final UserEntity userEntity;

  GettingProfileSuccessState({required this.userEntity});
}

class UpdatedNumState extends AuthState{
  final int num;

  UpdatedNumState({required this.num});
}


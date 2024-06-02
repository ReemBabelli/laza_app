import 'package:laza_app/features/auth/domain/entities/code_checking_entity.dart';
import 'package:laza_app/features/auth/domain/entities/mail_confirming _entity.dart';
import 'package:laza_app/features/auth/domain/entities/new_password_entity.dart';
import 'package:laza_app/features/auth/domain/entities/signin_entity.dart';
import 'package:laza_app/features/auth/domain/entities/signup_entity.dart';

abstract class AuthEvent {}

class InitEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final SignupEntity signupEntity;

  SignUpEvent({required this.signupEntity});
}

class SignInWithEmailEvent extends AuthEvent {
  final SignInEntity signInEntity;

  SignInWithEmailEvent({required this.signInEntity});
}

class SignOutEvent extends AuthEvent {
}

class MailConfirmingEvent extends AuthEvent {
  final MailConfirmingEntity confirmMailEntity;

  MailConfirmingEvent(this.confirmMailEntity);
}

class CodeCheckingEvent extends AuthEvent{
  final CodeCheckingEntity codeCheckingEntity;

  CodeCheckingEvent({required this.codeCheckingEntity});
}

class ResetPasswordEvent extends AuthEvent{
  final NewPasswordEntity newPasswordEntity;

  ResetPasswordEvent({required this.newPasswordEntity});
}

class GetProfileEvent extends AuthEvent{
}

class IncrementEvent extends AuthEvent {
  final int num;

  IncrementEvent({required this.num});
}

class DecrementEvent extends AuthEvent {
  final int num;

  DecrementEvent({required this.num});
}


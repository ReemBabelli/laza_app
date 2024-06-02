import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laza_app/features/auth/domain/entities/user_entity.dart';
import 'package:laza_app/features/auth/domain/use_cases/code_checking_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/get_profile_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/is_exist_in_cart_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/mail_confirming_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/new_password_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/sign_in_with_email_use_case.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/use_cases/sign_out_use_case.dart';
import '../../domain/use_cases/sign_up_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;
  final SignInWithEmailUseCase signInWithEmailUseCase;
  final SignOutUseCase signOutUseCase;
  final ConfirmMailUseCase confirmMailUseCase;
  final CodeCheckingUseCase codeCheckingUseCase;
  final NewPasswordUseCase newPasswordUseCase;
  final GetProfileUseCase getProfileUseCase;


  AuthBloc({
    required this.signUpUseCase,
    required this.signInWithEmailUseCase,
    required this.signOutUseCase,
    required this.confirmMailUseCase,
    required this.codeCheckingUseCase,
    required this.newPasswordUseCase,
    required this.getProfileUseCase,

  }) : super(AuthState().init()) {
    on<AuthEvent>((event, emit) async {

      if (event is SignUpEvent) {
        emit(AuthLoadingState());
        final failureOrStr = await signUpUseCase(event.signupEntity);
        emit(_foldSignUp(failureOrStr));
      }

      else if (event is SignInWithEmailEvent) {
        emit(AuthLoadingState());
        final failureOrStr = await signInWithEmailUseCase(event.signInEntity);
        emit(_foldSignIn(failureOrStr));
      }

      else if (event is SignOutEvent) {
        final failureOrStr = await signOutUseCase();
        emit(_fold(failureOrStr));
      }

      else if (event is MailConfirmingEvent) {
        emit(AuthLoadingState());
        final failureOrStr = await confirmMailUseCase(event.confirmMailEntity);
        emit(_fold(failureOrStr));
      }

      else if (event is CodeCheckingEvent) {
        emit(AuthLoadingState());
        final failureOrStr =
            await codeCheckingUseCase(event.codeCheckingEntity);
        emit(_fold(failureOrStr));
      }

      else if (event is ResetPasswordEvent) {
        emit(AuthLoadingState());
        final failureOrStr = await newPasswordUseCase(event.newPasswordEntity);
        emit(_foldSignIn(failureOrStr));
      }

      else if (event is GetProfileEvent) {
        emit(AuthLoadingState());
        final failureOrProfile = await getProfileUseCase();
        emit(_foldProfile(failureOrProfile));
      }

      if (event is IncrementEvent) {
        emit(UpdatedNumState(num: event.num + 1));
      }

      else if (event is DecrementEvent) {
        if(event.num > 0){
          emit(UpdatedNumState(num: event.num - 1));
        }
      }


    });
  }


}

AuthState _fold(Either<Failure, String> failureOrUnit) {
  return failureOrUnit.fold(
      (failure) => AuthErrorState(errMessage: failure.errMessage),
      (sucMessage) => AuthSuccessState(sucMessage: sucMessage));
}

AuthState _foldSignUp(Either<Failure, String> failureOrUnit) {
  return failureOrUnit.fold(
      (failure) => AuthErrorState(errMessage: failure.errMessage),
      (sucMessage) => AuthSignUpSuccessState(sucMessage: sucMessage));
}

AuthState _foldSignIn(Either<Failure, String> failureOrUnit) {
  return failureOrUnit.fold(
      (failure) => AuthErrorState(errMessage: failure.errMessage),
      (username) => AuthSignInSuccessState(username: username));
}

AuthState _foldProfile(Either<Failure, UserEntity> failureOrProfile) {
  return failureOrProfile.fold(
      (failure) => AuthErrorState(errMessage: failure.errMessage),
      (profileEntity) => GettingProfileSuccessState(userEntity: profileEntity));
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/core/widgets/text_field_widget.dart';
import 'package:laza_app/features/auth/domain/entities/new_password_entity.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_event.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_state.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController passwordCont = TextEditingController();
  TextEditingController confirmedPasswordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignInSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("The password has been changed successfully")));
          context.goNamed(MyRouter2.home);
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: state is AuthLoadingState
              ? const Center(
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  ),
                )
              : BottomButton(
                  text: 'Reset password',
                  onPressed: () {
                    NewPasswordEntity newPasswordEntity = NewPasswordEntity(
                        newPassword: passwordCont.text,
                        confirmedPassword: confirmedPasswordCont.text);
                    BlocProvider.of<AuthBloc>(context).add(ResetPasswordEvent(
                        newPasswordEntity: newPasswordEntity));
                  }),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(
                  onPressed: (){
                    context.goNamed(MyRouter2.verification);
                  },
                ),
                const VerticalSpace(2),
                Center(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(children: [
                        Text(
                          'New Password',
                          style: Theme.of(context).textTheme.headlineSmall,

                          // style: getBlackTitle28b(context),
                        ),
                        const VerticalSpace(20),
                        PasswordTextFieldWidget(controller: passwordCont),
                        const VerticalSpace(0.5),
                        TextFieldWidget(
                          labelText: 'Confirm password',
                          controller: confirmedPasswordCont,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please check your password";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const VerticalSpace(20),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}

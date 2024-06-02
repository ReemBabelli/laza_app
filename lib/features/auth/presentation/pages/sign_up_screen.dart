import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/switch_widget.dart';
import 'package:laza_app/core/widgets/text_field_widget.dart';
import 'package:laza_app/features/auth/domain/entities/signup_entity.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_event.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_state.dart';
import 'package:laza_app/features/auth/presentation/pages/sign_in_screen.dart';import '../../../../core/widgets/space_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool remember = true;
  bool state = true;

  @override
  void initState() {
    emailCont.text =  "";
    passwordCont.text = "";
    userNameCont.text ="";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignUpSuccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.sucMessage)));
          context.pushNamed(MyRouter2.signIn,queryParameters: {'email':emailCont.text});
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: state is AuthLoadingState
              ? Center(
                  child: Container(
                    height: 25,
                    width: 25,
                    child: const CircularProgressIndicator(
                      color: mainColor,
                    ),
                  ),
                )
              : BottomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final signupEntity = SignupEntity(
                          email: emailCont.text,
                          username: userNameCont.text,
                          password: passwordCont.text);
                      BlocProvider.of<AuthBloc>(context)
                          .add(SignUpEvent(signupEntity: signupEntity));
                    }
                  }),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(
                  onPressed: (){
                    context.pop();
                  },
                ),
                const VerticalSpace(2),
                Center(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            'Sign Up',
                            // style: getBlackTitle28b(context),
                           style:  Theme.of(context).textTheme.headlineMedium,
                          ),
                          const VerticalSpace(15),
                          TextFieldWidget(
                            labelText: 'Username',
                            controller: userNameCont,
                            inputType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "username must not be empty";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const VerticalSpace(0.5),
                          PasswordTextFieldWidget(controller: passwordCont),
                          const VerticalSpace(0.5),
                          TextFieldWidget(
                            labelText: 'Email',
                            controller: emailCont,
                            inputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email must not be empty";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const VerticalSpace(4),
                          Row(
                            children: [
                              Text(
                                'Remember me',
                                // style: getBlackText13(context),
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const Spacer(),
                              const SwitchWidget()
                            ],
                          ),
                          //VerticalSpace(15),
                        ],
                      ),
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
/* if (state is AuthLoadingState) {
              return const CircularProgressIndicator(color: Colors.white,);
            }*/
/* BottomButton(
              text: 'Sign Up',
              onPressed: () {
                final signupEntity = SignupEntity(
                    email: emailCont.text,
                    username: userNameCont.text,
                    password: passwordCont.text);
                BlocProvider.of<AuthBloc>(context)
                    .add(SignUpEvent(signupEntity: signupEntity));
              })*/

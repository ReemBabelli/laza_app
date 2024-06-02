import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/theme/theme_utilities/styles.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/loading_widget.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/core/widgets/switch_widget.dart';
import 'package:laza_app/core/widgets/text_field_widget.dart';
import 'package:laza_app/features/auth/domain/entities/signin_entity.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_event.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_state.dart';

class SignInScreen extends StatefulWidget {
  final String? email;
   const SignInScreen({super.key,  this.email});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  var formKey = GlobalKey<FormState>();
   @override
   void initState() {
     emailCont.text = widget.email ?? "";
     passwordCont.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthSignInSuccessState){
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("You logged in successfully ")));
          context.pushNamed(MyRouter2.home);
        } else if(state is AuthErrorState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {

          return Scaffold(
      bottomNavigationBar:state is AuthLoadingState
            ?  LoadingWidget():
            BottomButton(
          text: 'log In',
          onPressed: ()  {
            if (formKey.currentState!.validate()){
              final signInEntity = SignInEntity(email: emailCont.text ,password:passwordCont.text );
              BlocProvider.of<AuthBloc>(context).add(SignInWithEmailEvent(signInEntity: signInEntity));
            }

          }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(
              onPressed: (){
                context.goNamed(MyRouter2.signUp);
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
                        'Welcome',
                        // style: getBlackTitle25b(context),
                        style:  Theme.of(context).textTheme.headlineMedium,
                      ),
                      const VerticalSpace(15),
                      TextFieldWidget(
                        labelText: 'Email',
                        controller: emailCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email must not be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const VerticalSpace(0.5),
                      PasswordTextFieldWidget(controller: passwordCont),
                      const VerticalSpace(0.5),
                      Row(
                        children: [
                          const Spacer(),
                          CustomTextButton(
                              text: 'Forgot password ?',
                              onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (_) =>
                                //         const ForgotPasswordScreen()));
                                context.goNamed(MyRouter2.forgotPassword);
                              },
                              textStyle: getRedText15(context)),
                        ],
                      ),
                      const VerticalSpace(0.5),
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
                      const VerticalSpace(15),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'By connecting your account confirm that you agree with our term and condition',
                          // style: getGreyText13(context),
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
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


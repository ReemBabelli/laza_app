import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/theme/theme_utilities/styles.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/core/widgets/text_field_widget.dart';
import 'package:laza_app/features/auth/domain/entities/mail_confirming _entity.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_event.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_state.dart';
import '../../../../resources/resources.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthSuccessState){
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("The verification code was received, check your email")));
          context.goNamed(MyRouter2.verification);
        } else if(state is AuthErrorState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
              bottomNavigationBar: state is AuthLoadingState?Center(
                child: Container(
                  height: 25,
                  width: 25,
                  child: const CircularProgressIndicator(
                    color: mainColor,
                  ),
                ),
              ) :BottomButton(
                  text: 'Confirm Mail',
                  onPressed: () {
                    MailConfirmingEntity confirmMailEntity = MailConfirmingEntity(email: emailCont.text);
                    BlocProvider.of<AuthBloc>(context).add(MailConfirmingEvent(confirmMailEntity));

                  }),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButton(
                      onPressed: (){
                        context.pop();
                        // context.goNamed(MyRouter2.signIn);
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
                                'Would you like to reset Password',
                                style: Theme.of(context).textTheme.headlineSmall,

                                // style: getBlackTitle28b(context),
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                    Images.cloud,
                                    fit: BoxFit.cover,
                                    width: SizeConfig.screenWidth! * 0.6,
                                    height: SizeConfig.screenWidth! * 0.6,
                                  ),
                                  Positioned(
                                      left: SizeConfig.screenWidth! * 0.15,
                                      bottom: 0,
                                      child: Image.asset(
                                        Images.lock1,
                                        fit: BoxFit.cover,
                                        width: SizeConfig.screenWidth! * 0.3,
                                        height: SizeConfig.screenWidth! * 0.3,
                                      ))
                                ],
                              ),
                              const VerticalSpace(1),
                              TextFieldWidget(labelText: 'Email',
                                controller: emailCont,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "email must not be empty";
                                  } else {
                                    return null;
                                  }
                                },),
                              const VerticalSpace(22),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Please write your email to receive a confirmation code to set a new password.',
                                  style: getGreyText13(context),
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
            ));
      },
    );
  }
}

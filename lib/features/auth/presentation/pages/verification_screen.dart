import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/features/auth/domain/entities/code_checking_entity.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_event.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_state.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../../resources/resources.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _onEditing = true;
  String? _code;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Your email has been successfully verified")));
          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (_) => const NewPasswordScreen()));
          context.goNamed(MyRouter2.newPassword);
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
                  text: 'Confirm code',
                  onPressed: () {
                    final codeCheckingEntity =
                        CodeCheckingEntity(verCode: _code);
                    BlocProvider.of<AuthBloc>(context).add(CodeCheckingEvent(
                        codeCheckingEntity: codeCheckingEntity));
                  }),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(
                  onPressed: (){
                    context.goNamed(MyRouter2.forgotPassword);
                  },
                ),
                const VerticalSpace(2),
                Center(
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            'Verification Code',
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
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(

                              children: [
                                VerificationCode(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge!,
                                  keyboardType: TextInputType.number,
                                  underlineColor: mainColor,
                                  length: 4,
                                  cursorColor: Colors.blueGrey,
                                  clearAll: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'clear all',
                                      style: Theme.of(context).textTheme.titleSmall,

                                      // style: getBlackText15(context),
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(12),
                                  onCompleted: (String value) {
                                    setState(() {
                                      _code = value;
                                    });
                                  },
                                  onEditing: (bool value) {
                                    setState(() {
                                      _onEditing = value;
                                    });
                                    if (!_onEditing)
                                      FocusScope.of(context).unfocus();
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: _onEditing
                                        ? const Text('Please enter full code')
                                        : Text('Your code: $_code'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}

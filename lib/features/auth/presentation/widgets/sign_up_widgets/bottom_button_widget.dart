// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:laza/core/widgets/custom_buttons.dart';
// import 'package:laza/features/auth/domain/entities/signup_entity.dart';
// import 'package:laza/features/auth/domain/entities/user_entity.dart';
// import 'package:laza/features/auth/presentation/manager/auth_bloc.dart';
// import 'package:laza/features/auth/presentation/manager/auth_event.dart';
// import 'package:laza/features/auth/presentation/manager/auth_state.dart';
// import 'package:laza/pages/home_screen.dart';
//
// class BottomButtonWidget extends StatefulWidget {
//   final SignupEntity signupEntity;
//   final GlobalKey<FormState> formKey;
//   const BottomButtonWidget({super.key, required this.signupEntity, required this.formKey});
//
//   @override
//   State<BottomButtonWidget> createState() => _BottomButtonWidgetState();
// }
//
// class _BottomButtonWidgetState extends State<BottomButtonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthBloc, AuthState>(
//       listener: (context, state) {
//         if(state is AuthSuccessState){
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.sucMessage)));
//           Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const HomeScreen()));
//         }else if(state is AuthErrorState){
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
//         }
//       },
//       builder: (context, state) {
//         if(state is AuthLoadingState){
//           return  const CircularProgressIndicator(color: Colors.white,);
//         }
//         else{
//           return BottomButton(
//               text: 'Sign Up',
//               onPressed: () {
//                 if(widget.formKey.currentState!.validate()){
//                   BlocProvider.of<AuthBloc>(context).add(SignUpEvent(signupEntity: widget.signupEntity));
//                 }
//
//               });
//         }
//       },
//     );
//   }
// }

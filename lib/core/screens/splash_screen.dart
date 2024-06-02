import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/utilities/router2.dart';
import '../../resources/resources.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).goNamed(MyRouter2.starter);
      // context.goNamed(MyRouter2.starter);
    });
    return Scaffold(
       // backgroundColor:Theme.of(context).colorScheme.primary,
        body: Center(
          child: Image.asset(
            Images.logoNoBackground,
            fit: BoxFit.cover,
            width: 200,
            height: 200,
          ),
        ));
  }
}

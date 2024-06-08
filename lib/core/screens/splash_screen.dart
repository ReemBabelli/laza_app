import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/features/auth/data/data_sources/user_local_data_source.dart';
import '../../resources/resources.dart';
import 'package:laza_app/injection_container.dart' as di;


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), ()async {
      final isLoggedIn =await di.sl<UserLocalDataSource>().isLoggedIn();
      if(isLoggedIn){
        GoRouter.of(context).goNamed(MyRouter2.home);
      }else
      {
        GoRouter.of(context).goNamed(MyRouter2.starter);
      }
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

import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Center(
          child: Container(
            height: 25,
              width: 25,
            child: const CircularProgressIndicator(
              color: mainColor,
            ),
          ),
        ),
      );
  }
}

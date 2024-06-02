import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String errMessage;

  const ErrorMessageWidget({super.key, required this.errMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
            // height: 30,
            // width: 30,
            child: Text(
              errMessage,
              style: Theme.of(context).textTheme.titleLarge,
            )),
      ),
    );
  }
}

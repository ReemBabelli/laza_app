import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';

class DialogWidget extends StatelessWidget {
  final String text;
  final String eventText;
  final void Function() event;

   DialogWidget({super.key, required this.text, required this.eventText, required this.event,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(text,
          style: Theme.of(context).textTheme.labelLarge,
          ),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child:  Text("cancel",
              style: Theme.of(context).textTheme.labelLarge,

              // style: getBlackText13(context),
            )),
        TextButton(
            onPressed: event
              // context.read<AuthBloc>().add(SignOutEvent());
            ,
            child:  Text(eventText,style: TextStyle(color: mainColor),)),
      ],
    );
  }
}

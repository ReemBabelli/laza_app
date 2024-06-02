import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  final String size;
  const SizeWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
        width: 75,
      decoration: BoxDecoration(
        color:Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Text(
            size ,
        style: Theme.of(context).textTheme.titleLarge,)
      ),
    );
  }
}

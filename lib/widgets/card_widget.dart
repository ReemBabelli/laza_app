import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';

class CardWidget extends StatelessWidget {
  final String image;

  const CardWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 70,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(image),
    )
    ;
  }
}

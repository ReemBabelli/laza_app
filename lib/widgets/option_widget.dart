import 'package:flutter/material.dart';
import 'package:laza_app/core/widgets/space_widget.dart';

class OptionWidget extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;

  const OptionWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x00000000),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                widget.image,
                fit: BoxFit.fill,
                width: 50,
                height: 50,
              )),
          HorizontalSpace(1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                widget.subtitle,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green),
              child: isChecked
                  ? const Icon(
                      Icons.check_circle_outlined,
                      size: 30.0,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.circle_outlined,
                      size: 30.0,
                      color: Colors.white,
                    ),
            ),
          )
        ],
      ),
    );
  }
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.amber;
}

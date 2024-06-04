import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool mode = false;
  @override
  Widget build(BuildContext context) {

    return Switch(
        activeTrackColor: mainColor,
        value: mode,
        onChanged: (value) {
          setState(() {
            mode = value;
          });
        });
  }
}

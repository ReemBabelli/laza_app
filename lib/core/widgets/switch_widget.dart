import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/theme/cubit/theme_cubit.dart';
import 'package:laza_app/core/theme/cubit/theme_states.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, state) {
        if(state is SwitchThemeState){
          bool mode = state.themeMode == ThemeMode.dark ? true : false;
          return Switch(
              activeTrackColor: mainColor,
              value: mode,
              onChanged: (value) {
                setState(() {
                  mode = value;
                  if (value) {
                    context.read<ThemeCubit>()
                      .cacheTheme("dark");
                  } else {
                    context.read<ThemeCubit>()
                      .cacheTheme("light");
                  }
                });
              });
        }
        else {
          return Container();
        }
      },
    );
  }
}

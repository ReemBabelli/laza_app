import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/cubit/theme_cubit.dart';
import 'package:laza_app/core/theme/cubit/theme_states.dart';
import 'package:laza_app/core/theme/theme_utilities/dark_theme.dart';
import 'package:laza_app/core/theme/theme_utilities/light_theme.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/products/presentation/manager/product_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:laza_app/injection_container.dart' as di;
import 'features/auth/presentation/manager/auth_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //configureDependencies();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<AuthBloc>()),
          BlocProvider(create: (_) => di.sl<ProductBloc>()),
          BlocProvider(create: (_) => di.sl<ThemeCubit>()),
        ],
        child: BlocProvider(
          create:(context) => di.sl<ThemeCubit>()..getCachedTheme(),
          child: BlocBuilder<ThemeCubit, ThemeStates>(
            builder: (context, state) {
              if (state is SwitchThemeState) {
                return MaterialApp.router(
                  routerConfig: MyRouter2.router,
                  builder: (context, child) =>
                      ResponsiveBreakpoints(breakpoints: const [
                        Breakpoint(start: 0, end: 450, name: MOBILE),
                        Breakpoint(start: 451, end: 800, name: TABLET),
                        Breakpoint(start: 801, end: 1920, name: DESKTOP),
                        Breakpoint(
                            start: 1921, end: double.infinity, name: '4k'),
                      ], child: child!),
                  debugShowCheckedModeBanner: false,
                  title: 'Laza',
                  themeMode: state.themeMode,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  // home: SignUpScreen()
                );
              }
              else
                return Container();
            },
          ),
        )
    );
  }
}

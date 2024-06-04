import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/theme/cubit/theme_cubit.dart';
import 'package:laza_app/core/theme/cubit/theme_states.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/theme/theme_utilities/styles.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/core/widgets/switch_widget.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_event.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_state.dart';
import 'package:laza_app/features/auth/presentation/widgets/dialog_widget.dart';
import '../../../../resources/resources.dart';

class SideBarWidget extends StatefulWidget {
  final String username;

  const SideBarWidget({super.key, required this.username});

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.3,
                ),
                CircleAvatar(
                  child: Image.asset(
                    Images.person4,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.username,
                  // style: getBlackText17b(context),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            SideBarButton(
              image:Theme.of(context).brightness == Brightness.dark
                  ? Images.sunWhite
                  : Images.sunBlack,
              text: 'Dark mode',
              suffix: buildThemeSwitch(),
              onPressed: () {},
            ),
            const VerticalSpace(2),
            SideBarButton(
              image: Theme.of(context).brightness == Brightness.dark
                  ? Images.infoCircleWhite
                  : Images.infoCircleBlack,
              text: 'Account information',
              onPressed: () {},),
            const VerticalSpace(2),
            SideBarButton(
              image:  Theme.of(context).brightness == Brightness.dark
                  ? Images.lockWhite
                  : Images.lockBlack,
              text: 'Password', onPressed: () {
              context.pushNamed(MyRouter2.resetPassword);
            },),
            const VerticalSpace(2),
            SideBarButton(
              image: Theme.of(context).brightness == Brightness.dark
                  ? Images.bagWhite
                  : Images.blackBag,
              text: 'Order', onPressed: () {
                context.pushNamed(MyRouter2.cart);
            },),
            const VerticalSpace(2),
            SideBarButton(
              image:  Theme.of(context).brightness == Brightness.dark
                  ? Images.wallletWhite
                  : Images.blackWallet,
              text: 'My cards', onPressed: () {},),
            const VerticalSpace(2),
            SideBarButton(
              image: Theme.of(context).brightness == Brightness.dark
                  ? Images.heartWhite
                  : Images.heartBlack,
              text: 'Wishlist', onPressed: () {
                context.pushNamed(MyRouter2.wishList);
            },),
            // const VerticalSpace(2),
            // SideBarButton(
            //   image: Images.setting, text: 'Settings', onPressed: () {},),
            const Spacer(),
            SideBarButton(
              image: Images.logout,
              text: 'Logout',
              textStyle: getRedText15(context),
              onPressed: () {
                showDialog(context: context, builder: (context) {
                  return BlocConsumer<AuthBloc,AuthState>(
                      builder: (context, state) {
                        return DialogWidget(
                          text: "Do you want to log out of your account ?",
                          eventText: "Log out",
                          event:() {
                              context.read<AuthBloc>().add(SignOutEvent());
                            });
                      }, listener: (context, state) {
                    if (state is AuthSuccessState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                          SnackBar(content: Text(state.sucMessage)));
                      context.goNamed(MyRouter2.startWith);
                    } else if (state is AuthErrorState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                          SnackBar(content: Text(state.errMessage)));
                    }
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }

  buildThemeSwitch() {
    return  BlocBuilder<ThemeCubit, ThemeStates>(
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

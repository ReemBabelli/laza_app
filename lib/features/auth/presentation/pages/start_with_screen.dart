import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';

class StartWithScreen extends StatelessWidget {
  const StartWithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomButton(
            text: 'Create an Account',
            onPressed: () {
              context.pushNamed(MyRouter2.signUp);
            }),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(
              onPressed: () {
                context.pop();
              },
            ),
            const VerticalSpace(2),
            Center(
              child: Column(
                children: [
                  Text(
                    'Let\'s Get Started',
                    // style: getBlackTitle28b(context),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const VerticalSpace(15),
                  GeneralButton(
                      text: 'Facebook', color: facebookColor, onPressed: () {}),
                  const VerticalSpace(1),
                  GeneralButton(
                      text: 'Twitter', color: twitterColor, onPressed: () {}),
                  const VerticalSpace(1),
                  GeneralButton(
                      text: 'Google', color: googleColor, onPressed: () {}),
                   const VerticalSpace(23),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?  ',
                        style: Theme.of(context).textTheme.titleMedium,
                        // style: getGreyText15(context)
                      ),
                      CustomTextButton(
                          text: 'sign in',
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SignInScreen()));
                            context.pushNamed(
                              MyRouter2.signIn,
                            );
                          })
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

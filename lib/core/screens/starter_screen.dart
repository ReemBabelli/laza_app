import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/resources/resources.dart';

class StarterScreen extends StatefulWidget {
  const StarterScreen({super.key});

  @override
  State<StarterScreen> createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              Images.man1,
              fit: BoxFit.cover,
              width: SizeConfig.screenWidth!,
              height: SizeConfig.screenHeight!,
            ),
            Positioned(
              bottom: 10,
              left: SizeConfig.screenWidth! * 0.1 / 2,
              child: Container(
                padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
                width: SizeConfig.screenWidth! * 0.9,
                height: SizeConfig.screenHeight! / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Column(
                  children: [
                    const VerticalSpace(1),
                    Text(
                      'Look Good, Feel good',
                      //style: getBlackTitle25b(context),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Padding(
                      padding:  EdgeInsets.all(SizeConfig.defaultSize! * 4),
                      child: Text(
                        'Create your individual & unique style and look amazing everyday',
                          // style: getGreyText15(context),
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const VerticalSpace(1),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GeneralButton(
                          width: SizeConfig.screenWidth! * 0.7 / 2 - 25,
                          text: 'Let\'s start',
                          onPressed: () {
                            context.pushNamed(MyRouter2.startWith);
                          },
                          color: Theme.of(context).colorScheme.primary,
                          // textStyle: getGreyText17(context),
                          textStyle: Theme.of(context).textTheme.titleMedium,
                        ),

                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

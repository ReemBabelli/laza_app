import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/theme_utilities/styles.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/widgets/card_widget.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/core/widgets/text_field_widget.dart';

import '../resources/resources.dart';


class AddingNewCardScreen extends StatefulWidget {
  const AddingNewCardScreen({super.key});

  @override
  State<AddingNewCardScreen> createState() => _AddingNewCardScreenState();
}

class _AddingNewCardScreenState extends State<AddingNewCardScreen> {
  TextEditingController cardOwnerCont = TextEditingController();
  TextEditingController cardNumCont = TextEditingController();
  TextEditingController cardExpCont = TextEditingController();
  TextEditingController cvvCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            Center(
              child: Column(
                children: [
                  Text(
                    'Add New Card',
                    style: getBlackText17b(context),
                  ),
                  const VerticalSpace(2),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CardWidget(image: Images.newCard11),
                      CardWidget(image: Images.newCard22),
                      CardWidget(image: Images.newCard3)
                    ],
                  ),
                  const VerticalSpace(2),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Card Owner',
                style: getBlackText15(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Center(
                  child: BorderedTextField(
                controller: cardOwnerCont,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "card owner must not be empty";
                  } else {
                    return null;
                  }
                },
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Card Number',
                style: getBlackText15(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Center(
                  child: BorderedTextField(
                controller: cardNumCont,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "card number must not be empty";
                  } else {
                    return null;
                  }
                },
                inputType: TextInputType.number,
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Center(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'EXP',
                          style: getBlackText15(context),
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: SizedBox(
                              width: SizeConfig.screenWidth! * 0.4,
                              child: BorderedTextField(
                                controller: cardExpCont,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Expiration date must not be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                inputType: TextInputType.datetime,
                              )),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV',
                          style: getBlackText15(context),
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: SizedBox(
                              width: SizeConfig.screenWidth! * 0.4,
                              child: BorderedTextField(
                                controller: cvvCont,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "cvv must not be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                inputType: TextInputType.number,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const VerticalSpace(22),
            BottomButton(text: 'Add Card', onPressed: () {}),
          ],
        ),
      ),
    ));
  }
}

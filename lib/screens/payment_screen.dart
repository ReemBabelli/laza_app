import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/theme/theme_utilities/styles.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/core/widgets/switch_widget.dart';
import 'package:laza_app/core/widgets/text_field_widget.dart';
import 'package:laza_app/screens/adding_new_card_screen.dart';
import '../resources/resources.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardOwnerCont = TextEditingController();
  TextEditingController cardNumCont = TextEditingController();
  TextEditingController cardExpCont = TextEditingController();
  TextEditingController cvvCont = TextEditingController();
  bool state = false;

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
                    'Payment',
                    style: getBlackText17b(context),
                  ),
                  const VerticalSpace(1),
                  SvgPicture.asset(
                    Images.card1,
                  ),
                  const VerticalSpace(2),
                  GeneralButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const AddingNewCardScreen()));
                    },
                    color: blueWhiteColor,
                    icon: SvgPicture.asset(Images.addCard),
                  )
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Save card info',
                      style: getBlackText15(context),
                    ),
                    const Spacer(),
                    const SwitchWidget()
                  ],
                ),
              ),
            ),
            const VerticalSpace(2),
            BottomButton(text: 'Save Card', onPressed: () {})
          ],
        ),
      ),
    ));
  }
}

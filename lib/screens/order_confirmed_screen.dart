import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/theme/theme_utilities/styles.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';

import '../resources/resources.dart';


class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            Column(
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth,
                  child: Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          Images.mobile,
                          fit: BoxFit.cover,
                          width: SizeConfig.screenWidth! * 0.5,
                        ),
                        Positioned(
                            top: SizeConfig.screenHeight! * 0.15,
                            right: SizeConfig.screenWidth! * 0.15,
                            child: Image.asset(
                              Images.confirmed,
                              fit: BoxFit.cover,
                              width: SizeConfig.screenWidth! * 0.2,
                            )),
                      ],
                    ),
                  ),
                ),
                const VerticalSpace(2),
                Text(
                  'Order Confirmed!',
                  style: getBlackTitle28b(context),
                ),
                const VerticalSpace(1),
                Text(
                  'Your order has been confirmed, we will send you confirmation email shortly.',
                  style: getGreyText15(context),
                  textAlign: TextAlign.center,
                ),
                const VerticalSpace(7),
                GeneralButton(
                  text: 'Go to Orders',
                  onPressed: () {},
                  color: whiteColor,
                  textStyle: getGreyText15(context),
                ),
              ],
            ),
            const Spacer(),
            BottomButton(
                text: 'Continue shopping',
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/theme_utilities/styles.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/core/widgets/switch_widget.dart';
import 'package:laza_app/core/widgets/text_field_widget.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController countryCont = TextEditingController();
  TextEditingController cityCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();

  bool state = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButton(),
                  Center(
                    child: Text(
                      'Address',
                      style: getBlackText17b(context),
                    ),
                  ),
                  const VerticalSpace(2),
                  Text(
                    'Name',
                    style: getBlackText15(context),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: BorderedTextField(
                      hintText: 'Type your name',
                      controller: nameCont,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name must not be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const VerticalSpace(2),
                  Center(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Country',
                              style: getBlackText15(context),
                            ),
                            const SizedBox(height: 5),
                            Center(
                              child: SizedBox(
                                width: SizeConfig.screenWidth! * 0.4,
                                child: BorderedTextField(
                                  hintText: 'Type your country',
                                  controller: countryCont,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "country must not be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'City',
                              style: getBlackText15(context),
                            ),
                            const SizedBox(height: 5),
                            Center(
                              child: SizedBox(
                                width: SizeConfig.screenWidth! * 0.4,
                                child: BorderedTextField(
                                  hintText: 'Type your city',
                                  controller: cityCont,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "city must not be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpace(2),
                  Text(
                    'Phone number',
                    style: getBlackText15(context),
                  ),
                  const SizedBox(height: 5),
                  Center(
                      child: BorderedTextField(
                    hintText: 'Type your phone number',
                    controller: phoneCont,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone number must not be empty";
                      } else {
                        return null;
                      }
                    },
                    inputType: TextInputType.number,
                  )),
                  const VerticalSpace(2),
                  Text(
                    'Address',
                    style: getBlackText15(context),
                  ),
                  const SizedBox(height: 5),
                  Center(
                      child: BorderedTextField(
                    hintText: 'Type your  Address',
                    controller: addressCont,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Address must not be empty";
                      } else {
                        return null;
                      }
                    },
                  )),
                  const VerticalSpace(2),
                  Row(
                    children: [
                       Text('Save as primary address',style: getBlackText15(context),),
                      const Spacer(),
                      const SwitchWidget()
                    ],
                  )
                ],
              ),
            ),
            const VerticalSpace(10),
           BottomButton(text: 'Save Address', onPressed: (){})


          ],
        ),
      ),
    ));
  }
}


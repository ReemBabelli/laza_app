import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';


TextStyle getBlackText13(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 13.00),
        Condition.equals(name: TABLET, value: 15.00),
        Condition.equals(name: DESKTOP, value: 17.00),
        Condition.largerThan(name: DESKTOP, value: 19.00),
      ],
      defaultValue: 13.00,
    ).value,
    color: Colors.black,
  );
}

TextStyle getBlackText15(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 15.00),
        Condition.equals(name: TABLET, value: 17.00),
        Condition.equals(name: DESKTOP, value: 19.00),
        Condition.largerThan(name: DESKTOP, value: 21.00),
      ],
      defaultValue: 15.00,
    ).value,
    color: Colors.black,
  );
}

TextStyle getBlackText15b(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 15.00),
        Condition.equals(name: TABLET, value: 17.00),
        Condition.equals(name: DESKTOP, value: 19.00),
        Condition.largerThan(name: DESKTOP, value: 21.00),
      ],
      defaultValue: 15.00,
    ).value,
    color: Colors.black,
    fontWeight: FontWeight.bold
  );
}

TextStyle getBlackText17b(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 17.00),
        Condition.equals(name: TABLET, value: 19.00),
        Condition.equals(name: DESKTOP, value: 21.00),
        Condition.largerThan(name: DESKTOP, value: 23.00),
      ],
      defaultValue: 17.00,
    ).value,
    color: Colors.black,
    fontWeight: FontWeight.w500
  );
}

TextStyle getBlackTitle22b(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 22.00),
        Condition.equals(name: TABLET, value: 24.00),
        Condition.equals(name: DESKTOP, value: 26.00),
        Condition.largerThan(name: DESKTOP, value: 28.00),
      ],
      defaultValue: 22.00,
    ).value,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getBlackTitle25b(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 25.00),
        Condition.equals(name: TABLET, value: 27.00),
        Condition.equals(name: DESKTOP, value: 29.00),
        Condition.largerThan(name: DESKTOP, value: 31.00),
      ],
      defaultValue: 25.00,
    ).value,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getBlackTitle28b(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 28.00),
        Condition.equals(name: TABLET, value: 30.00),
        Condition.equals(name: DESKTOP, value: 32.00),
        Condition.largerThan(name: DESKTOP, value: 34.00),
      ],
      defaultValue: 28.00,
    ).value,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}

////////////////////////////////////////////////////////////////////////////////
TextStyle getGreyText11(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 11.00),
        Condition.equals(name: TABLET, value: 13.00),
        Condition.equals(name: DESKTOP, value: 15.00),
        Condition.largerThan(name: DESKTOP, value: 17.00),
      ],
      defaultValue: 11.00,
    ).value,
    color: Colors.black54,
  );
}

TextStyle getGreyText13(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 13.00),
        Condition.equals(name: TABLET, value: 15.00),
        Condition.equals(name: DESKTOP, value: 17.00),
        Condition.largerThan(name: DESKTOP, value: 19.00),
      ],
      defaultValue: 13.00,
    ).value,
    color: Colors.black54,
  );
}

TextStyle getGreyText15(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 15.00),
        Condition.equals(name: TABLET, value: 17.00),
        Condition.equals(name: DESKTOP, value: 19.00),
        Condition.largerThan(name: DESKTOP, value: 21.00),
      ],
      defaultValue: 15.00,
    ).value,
    color: Colors.black54,
  );
}

TextStyle getGreyText17(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 17.00),
        Condition.equals(name: TABLET, value: 19.00),
        Condition.equals(name: DESKTOP, value: 21.00),
        Condition.largerThan(name: DESKTOP, value: 23.00),
      ],
      defaultValue: 17.00,
    ).value,
    color: Colors.black54,
  );
}

////////////////////////////////////////////////////////////////////////////////
TextStyle getWhiteText13(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 13.00),
        Condition.equals(name: TABLET, value: 15.00),
        Condition.equals(name: DESKTOP, value: 17.00),
        Condition.largerThan(name: DESKTOP, value: 19.00),
      ],
      defaultValue: 13.00,
    ).value,
    color: Colors.white,
  );
}

TextStyle getWhiteText15b(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 15.00),
        Condition.equals(name: TABLET, value: 17.00),
        Condition.equals(name: DESKTOP, value: 29.00),
        Condition.largerThan(name: DESKTOP, value: 21.00),
      ],
      defaultValue: 15.00,
    ).value,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );
}

TextStyle getWhiteText17(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 17.00),
        Condition.equals(name: TABLET, value: 19.00),
        Condition.equals(name: DESKTOP, value: 21.00),
        Condition.largerThan(name: DESKTOP, value: 23.00),
      ],
      defaultValue: 17.00,
    ).value,
    color: Colors.white,
  );
}

////////////////////////////////////////////////////////////////////////////////
TextStyle getRedText15(BuildContext context) {
  return TextStyle(
      fontSize: ResponsiveValue(
        context,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 15.00),
          Condition.equals(name: TABLET, value: 17.00),
          Condition.equals(name: DESKTOP, value: 29.00),
          Condition.largerThan(name: DESKTOP, value: 21.00),
        ],
        defaultValue: 15.00,
      ).value,
      color: Colors.red,
  );
}
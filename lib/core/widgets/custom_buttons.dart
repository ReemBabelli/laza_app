import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/theme/theme_utilities/styles.dart';
import 'package:laza_app/core/utilities/size_config.dart';

class BottomButton extends StatefulWidget {
  final String text;
  final void Function() onPressed;

  const BottomButton({super.key, required this.text, required this.onPressed});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: SizeConfig.defaultSize! * 9,
        width: SizeConfig.screenWidth,
        decoration: const BoxDecoration(color: mainColor),
        child: Center(
          child: Text(
            widget.text,
            style: getWhiteText17(context),
          ),
        ),
      ),
    );
  }
}
//******************************************************************************

class GeneralButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String? text;
  final TextStyle? textStyle;
  final Color color;
  final Widget? icon;
  final void Function() onPressed;

  const GeneralButton(
      {super.key,
      this.text,
      required this.onPressed,
      this.icon,
      this.width,
      this.height,
      required this.color,
      this.textStyle});

  @override
  State<GeneralButton> createState() => _GeneralButtonState();
}

class _GeneralButtonState extends State<GeneralButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
          width: widget.width ?? SizeConfig.defaultSize! * 35,
          height: widget.height ?? SizeConfig.defaultSize! * 5,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(15),
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon ?? Container(),
            Text(
              widget.text ?? '',
              style: widget.textStyle ?? getWhiteText17(context),
            )
          ],
        ),
          ),
    );
  }
}
//******************************************************************************

class CustomTextButton extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final void Function() onPressed;

  const CustomTextButton(
      {super.key, required this.text, required this.onPressed, this.textStyle});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        child: Text(widget.text,
            style: widget.textStyle ??
                // getBlackText17b(context)
                Theme.of(context).textTheme.titleLarge
        ));
  }
}

//******************************************************************************

class SideBarButton extends StatefulWidget {
  final String image;
  final String text;
  final Widget? suffix;
  final TextStyle? textStyle;
  final void Function() onPressed;

  const SideBarButton(
      {super.key, required this.image, required this.text, this.suffix, this.textStyle, required this.onPressed});

  @override
  State<SideBarButton> createState() => _SideBarButtonState();
}
class _SideBarButtonState extends State<SideBarButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Row(children: [
        SvgPicture.asset(
          widget.image,
          fit: BoxFit.cover,
          width: 30,
          height: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          widget.text ,
          style:widget.textStyle??
              // getBlackText15(context),
              Theme.of(context).textTheme.labelLarge,
        ),
        const Spacer(),
        widget.suffix ?? Container()
      ]),
    );
  }
}

//******************************************************************************
//class Floa
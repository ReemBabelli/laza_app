import 'package:flutter/material.dart';
class TextFieldWidget extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double? width;
  final TextInputType? inputType;


  const TextFieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
    this.width,
    this.inputType,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.secondary,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: Theme.of(context).textTheme.titleLarge,
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide( color:Theme.of(context).colorScheme.secondary),
        ),

      ),
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.inputType,
    );
  }
}

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final double? width;

  const PasswordTextFieldWidget({
    super.key,
    required this.controller,
    this.width,
  });

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.secondary,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: Theme.of(context).textTheme.titleLarge,
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide( color:Theme.of(context).colorScheme.secondary),
          ),
        suffixIcon: IconButton(
            icon: Icon(state ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                state = !state;
              });
            }),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: state,
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "password must not be empty";
        } else if (value.length <= 8) {
          return "password length must be more than 8 character";
        } else {
          return null;
        }
      },
    );
  }
}

class BorderedTextField extends StatefulWidget {
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final void Function(String)? onChange;

  const BorderedTextField(
      {super.key,
      this.hintText,
      required this.controller,
      this.validator,
      this.prefixIcon,
      this.maxLines,
      this.inputType,
      this.onChange});

  @override
  State<BorderedTextField> createState() => _BorderedTextFieldState();
}

class _BorderedTextFieldState extends State<BorderedTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.secondary,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        filled: true,
        fillColor:  Theme.of(context).colorScheme.primary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:  BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.titleSmall,
      ),
      maxLines: widget.maxLines ?? 1,
      keyboardType: widget.inputType ?? TextInputType.name,
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChange,
    );
  }
}

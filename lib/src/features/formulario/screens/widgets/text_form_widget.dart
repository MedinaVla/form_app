import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    Key? key,
    this.inputFormatters,
    this.obscureText = false,
    this.onChanged,
    this.controller,
    this.validator,
    this.errorFont,
    required this.labelText,
    required this.iconValue,
    required this.maxLength,
  }) : super(key: key);

  final double? errorFont;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final IconData iconValue;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        validator: validator,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          icon: Icon(iconValue),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: errorFont,
          ),
        ));
  }
}

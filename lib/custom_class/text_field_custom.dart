import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final String labelText;
  final bool obscureText;
  IconButton? suffixIcon;

  CustomTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.onChanged,
    this.validator,
    required this.hintText,
    this.obscureText = false,
    required this.labelText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;

    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(6.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.3, color: Colors.black),
              borderRadius: BorderRadius.circular(6.0)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.3, color: Colors.red),
              borderRadius: BorderRadius.circular(6.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.3, color: Colors.black),
              borderRadius: BorderRadius.circular(6.0)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

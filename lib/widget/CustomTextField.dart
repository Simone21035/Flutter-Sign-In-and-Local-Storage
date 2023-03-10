import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // const CustomTextField({super.key});

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;

  CustomTextField(
      {required this.labelText,
      required this.hintText,
      required this.controller,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)))),
      controller: controller,
    );
  }
}

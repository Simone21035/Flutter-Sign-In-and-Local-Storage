import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  // const PasswordField({super.key});
  final bool obscureText;
  final VoidCallback onTap;
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  PasswordField(
      {required this.obscureText,
      required this.onTap,
      required this.labelText,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(top: 12, right: 15, bottom: 10),
              child:
                  Icon(obscureText ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)))),
      controller: controller,
    );
  }
}

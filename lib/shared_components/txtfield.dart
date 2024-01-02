import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  TxtField({
    super.key,
    required this.controller,
    required this.obscureText,
    this.keyboardType,
  });
  final TextEditingController controller;
  final bool obscureText;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType ?? TextInputType.none,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

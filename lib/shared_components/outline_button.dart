// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class OutlineButtonWidget extends StatefulWidget {
  OutlineButtonWidget(
      {super.key,
      required this.title,
      required this.borderColor,
      required this.onTap,
      this.titleColor});
  final String title;
  final Color borderColor;
  final Function() onTap;
  Color? titleColor;

  @override
  State<OutlineButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<OutlineButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 65,
        width: double.infinity,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 1,
              color: widget.borderColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: widget.onTap,
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.titleColor ?? Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

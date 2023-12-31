// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  ButtonWidget(
      {super.key,
      required this.title,
      required this.btColor,
      required this.onTap,
      this.titleColor,
      this.isLoading});
  final String title;
  final Color btColor;
  final Function()? onTap;
  Color? titleColor;

  final bool? isLoading;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: widget.btColor,
        ),
        onPressed: widget.onTap,
        child: (widget.isLoading == false)
            ? Text(
                widget.title,
                style: TextStyle(
                  color: widget.titleColor ?? Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}

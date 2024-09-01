import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? weight;
  final Color? textcolor;
  const CustomText(
      {super.key,
      required this.text,
      this.fontSize,
      this.weight,
      this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
        color: textcolor,
      ),
    );
  }
}

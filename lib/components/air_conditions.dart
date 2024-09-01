import 'package:flutter/material.dart';
import 'package:weather_app/components/custom_text.dart';

class AirConditions extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String value;
  const AirConditions(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageUrl,
          width: 25,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            CustomText(
              text: text,
              textcolor: Color(0xff9298a1),
              fontSize: 16,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomText(
              text: value,
              textcolor: Color(0xffc4cad3),
              weight: FontWeight.bold,
              fontSize: 17,
            )
          ],
        )
      ],
    );
  }
}

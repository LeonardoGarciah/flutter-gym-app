import 'package:flutter/material.dart';
import 'package:flutter_gym_app/shared/enums/text_size_enum.dart';

class GymText extends StatelessWidget {
  final String text;
  final TextSizeEnum size;
  final TextStyle? style;
  final bool? boldText;

  const GymText(
    this.text, {
    super.key,
    this.size = TextSizeEnum.medium,
    this.style,
    this.boldText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size.value,
        color: Colors.white,
        fontWeight: boldText == true ? FontWeight.bold : FontWeight.normal,
      ).merge(style),
    );
  }
}

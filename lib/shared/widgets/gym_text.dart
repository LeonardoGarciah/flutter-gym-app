import 'package:flutter/material.dart';

class GymText extends StatelessWidget {
  final String text;

  const GymText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

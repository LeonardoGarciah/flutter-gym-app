import 'package:flutter/material.dart';

class GymDivider extends StatelessWidget {
  const GymDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).disabledColor,
      thickness: 1,
    );
  }
}

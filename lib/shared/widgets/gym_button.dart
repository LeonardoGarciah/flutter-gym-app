import 'package:flutter/material.dart';
import 'package:flutter_gym_app/shared/enums/button_size_enum.dart';
import 'package:flutter_gym_app/shared/enums/button_type_enum.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GymButton extends StatelessWidget {
  final String text;
  final ButtonSizeEnum size;
  final ButtonTypeEnum type;
  final IconData? icon;
  final Function() onPressed;

  const GymButton(
    this.text, {
    super.key,
    required this.onPressed,
    this.icon,
    this.size = ButtonSizeEnum.medium,
    this.type = ButtonTypeEnum.elevated,
  });

  @override
  Widget build(BuildContext context) {
    if (type == ButtonTypeEnum.text)
      return TextButton(
        style: TextButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.symmetric(
            horizontal: size.value / 2,
            vertical: size.value / 2,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FaIcon(
                  icon,
                  size: size.value / 2,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            Text(
              text,
              style: TextStyle(
                fontSize: size.value / 2,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      );

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).colorScheme.secondary,
        padding: EdgeInsets.symmetric(
          horizontal: size.value * 2,
          vertical: size.value / 2,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            FaIcon(
              icon,
              size: size.value / 2,
              color: Colors.white,
            ),
          Text(
            text,
            style: TextStyle(
              fontSize: size.value / 2,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

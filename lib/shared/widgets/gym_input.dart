import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GymInput extends StatelessWidget {
  final TextEditingController? controller;

  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool? obscureText;

  const GymInput({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final FocusNode _inputFocusNode = FocusNode();

    return TextField(
      controller: controller,
      obscureText: obscureText == true,
      style: const TextStyle(color: Colors.white),
      focusNode: _inputFocusNode,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.tertiary,
        focusColor: Theme.of(context).colorScheme.secondary,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Theme.of(context).disabledColor),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AnimatedBuilder(
            animation: _inputFocusNode,
            builder: (context, state) {
              return FaIcon(
                prefixIcon,
                size: 16,
                color: _inputFocusNode.hasFocus
                    ? Theme.of(context)
                        .colorScheme
                        .secondary
                    : Theme.of(context).disabledColor,
              );
            },
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: suffixIcon,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  Theme.of(context).colorScheme.secondary,
              width: 2.0),
          borderRadius: BorderRadius.circular(16),
        ),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

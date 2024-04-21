import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GymInput extends StatelessWidget {
  final TextEditingController? controller;

  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Function(String)? onChanged;

  const GymInput({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.obscureText,
    this.maxLength,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    final FocusNode _inputFocusNode = FocusNode();

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText == true,
      style: const TextStyle(color: Colors.white),
      focusNode: _inputFocusNode,
      textInputAction: textInputAction,
      maxLength: maxLength,
      onChanged: onChanged,
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

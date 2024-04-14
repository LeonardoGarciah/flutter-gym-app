import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GymTextFormField extends StatelessWidget {
  final TextEditingController? controller;

  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool? obscureText;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const GymTextFormField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.obscureText,
    this.inputFormatters,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    final FocusNode _inputFocusNode = FocusNode();

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText == true,
      style: const TextStyle(color: Colors.white),
      inputFormatters: inputFormatters,
      focusNode: _inputFocusNode,
      maxLength: maxLength,
      textInputAction: textInputAction,
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

import 'package:flutter/material.dart';
import 'package:flutter_gym_app/shared/widgets/gym_input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;

  const PasswordInput({super.key, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    final showPassword = ValueNotifier<bool>(false);

    return ValueListenableBuilder(
      valueListenable: showPassword,
      builder: (context, value, child) {
        return GymInput(
          controller: controller,
          prefixIcon: FontAwesomeIcons.lock,
          obscureText: !showPassword.value,
          suffixIcon: !value ? SizedBox(
            height: 32,
            width: 40,
            child: IconButton(
              onPressed: () {
                showPassword.value = !showPassword.value;
              },
              icon: Center(
                child: const FaIcon(
                  FontAwesomeIcons.solidEyeSlash,
                  size: 16,
                ),
              ),
            ),
          ) : SizedBox(
            height: 32,
            width: 40,
            child: IconButton(
              onPressed: () {
                showPassword.value = !showPassword.value;
              },
              icon: Center(
                child: const FaIcon(
                  FontAwesomeIcons.eye,
                  size: 16,
                ),
              ),
            ),
          ),
          hintText: hintText ?? 'Senha',
        );
      },
    );
  }
}

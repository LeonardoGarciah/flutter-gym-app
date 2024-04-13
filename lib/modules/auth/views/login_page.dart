import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_gym_app/shared/enums/button_size_enum.dart';
import 'package:flutter_gym_app/shared/enums/button_type_enum.dart';
import 'package:flutter_gym_app/shared/enums/text_size_enum.dart';
import 'package:flutter_gym_app/shared/widgets/gym_button.dart';
import 'package:flutter_gym_app/shared/widgets/gym_input.dart';
import 'package:flutter_gym_app/shared/widgets/gym_scaffold.dart';
import 'package:flutter_gym_app/shared/widgets/gym_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();

    return GymScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: GymText(
                'Entre na sua conta',
                boldText: true,
                size: TextSizeEnum.large,
              ),
            ),
            Gap(16),
            GymInput(
              controller: authController.emailController,
              prefixIcon: FontAwesomeIcons.envelope,
              hintText: 'Email',
            ),
            const Gap(16),
            GymInput(
              controller: authController.passwordController,
              prefixIcon: FontAwesomeIcons.lock,
              suffixIcon: FaIcon(
                FontAwesomeIcons.eye,
                size: 16,
              ),
              hintText: 'Password',
            ),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GymButton(
                  'Esqueceu a senha?',
                  onPressed: () {},
                  type: ButtonTypeEnum.text,
                  size: ButtonSizeEnum.small,
                ),
              ],
            ),
            const Gap(20),
            GymButton(
              'Entrar',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

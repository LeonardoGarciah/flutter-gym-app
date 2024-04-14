import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_gym_app/modules/auth/widgets/password_input.dart';
import 'package:flutter_gym_app/shared/enums/button_size_enum.dart';
import 'package:flutter_gym_app/shared/enums/button_type_enum.dart';
import 'package:flutter_gym_app/shared/enums/text_size_enum.dart';
import 'package:flutter_gym_app/shared/widgets/gym_button.dart';
import 'package:flutter_gym_app/shared/widgets/gym_divider.dart';
import 'package:flutter_gym_app/shared/widgets/gym_input.dart';
import 'package:flutter_gym_app/shared/widgets/gym_scaffold.dart';
import 'package:flutter_gym_app/shared/widgets/gym_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = AuthController();

    return GymScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GymText(
              'Entre na sua\nconta',
              boldText: true,
              size: TextSizeEnum.large,
            ),
            const Gap(16),
            GymInput(
              controller: controller.emailController,
              prefixIcon: FontAwesomeIcons.envelope,
              hintText: 'Email',
            ),
            const Gap(16),
            PasswordInput(
              controller: controller.passwordController,
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
            Center(
              child: GymButton(
                'Entrar',
                onPressed: controller.login,
              ),
            ),
            const Gap(40),
            const Row(
              children: [
                Expanded(child: GymDivider()),
                Gap(8),
                GymText('ou'),
                Gap(8),
                Expanded(child: GymDivider()),
              ],
            ),
            const Gap(40),
            Center(
              child: GymButton(
                'Cadastrar-se',
                onPressed: controller.gotoRegister,
                type: ButtonTypeEnum.elevated,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

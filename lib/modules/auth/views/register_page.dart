import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_gym_app/modules/auth/widgets/password_input.dart';
import 'package:flutter_gym_app/shared/enums/button_type_enum.dart';
import 'package:flutter_gym_app/shared/enums/text_size_enum.dart';
import 'package:flutter_gym_app/shared/widgets/gym_button.dart';
import 'package:flutter_gym_app/shared/widgets/gym_divider.dart';
import 'package:flutter_gym_app/shared/widgets/gym_input.dart';
import 'package:flutter_gym_app/shared/widgets/gym_scaffold.dart';
import 'package:flutter_gym_app/shared/widgets/gym_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              'Crie a sua\nconta',
              size: TextSizeEnum.large,
              boldText: true,
            ),
            const Gap(16),
            GymInput(
              controller: controller.emailController,
              prefixIcon: FontAwesomeIcons.envelope,
              hintText: 'Email',
            ),
            const Gap(16),
            GymInput(
              controller: controller.name,
              prefixIcon: FontAwesomeIcons.person,
              hintText: 'Nome',
            ),
            const Gap(16),
            PasswordInput(
              controller: controller.passwordController,
            ),
            const Gap(16),
            PasswordInput(
              controller: controller.confirmPasswordController,
              hintText: 'Confirmar senha',
            ),
            const Gap(40),
            Center(
              child: GymButton(
                'Registrar',
                onPressed: controller.register,
              ),
            ),
            const Gap(40),
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GymText('Já tem uma conta?', size: TextSizeEnum.small,),
                GymButton(
                  'Entrar',
                  onPressed: controller.gotoLogin,
                  type: ButtonTypeEnum.text,
                ),
              ],
           )
          ],
        ),
      ),
    );
  }
}

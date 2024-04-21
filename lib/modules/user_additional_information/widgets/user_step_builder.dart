import 'package:flutter/material.dart';
import 'package:flutter_gym_app/shared/enums/button_type_enum.dart';
import 'package:flutter_gym_app/shared/enums/text_size_enum.dart';
import 'package:flutter_gym_app/shared/widgets/gym_button.dart';
import 'package:flutter_gym_app/shared/widgets/gym_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class UserStepBuilder extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget body;

  final Function() nextStep;
  final Function()? previousStep;

  const UserStepBuilder({
    super.key,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.nextStep,
    this.previousStep,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GymText(
          title,
          size: TextSizeEnum.large,
          boldText: true,
          textAlign: TextAlign.center,
        ),
        const Gap(12),
        GymText(
          subtitle,
          textAlign: TextAlign.center,
          color: Theme.of(context).disabledColor,
        ),
        Expanded(
          child: Center(child: body),
        ),
        Row(
          mainAxisAlignment: previousStep == null ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
          children: [
            if (previousStep != null)
              GymButton(
                'Voltar',
                icon: FontAwesomeIcons.arrowLeft,
                onPressed: previousStep!,
                type: ButtonTypeEnum.text,
              ),
            GymButton(
              'Próximo',
              onPressed: nextStep,
            )
          ],
        ),
      ],
    );
  }
}

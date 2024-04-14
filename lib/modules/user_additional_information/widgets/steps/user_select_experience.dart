import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/user_additional_information/enums/user_additional_information_step_enum.dart';
import 'package:flutter_gym_app/modules/user_additional_information/enums/user_experience_enum.dart';
import 'package:flutter_gym_app/modules/user_additional_information/provider/user_step_provider.dart';
import 'package:flutter_gym_app/modules/user_additional_information/widgets/user_step_builder.dart';
import 'package:flutter_gym_app/shared/enums/text_size_enum.dart';
import 'package:flutter_gym_app/shared/widgets/gym_text.dart';

class UserSelectExperience extends StatelessWidget {
  const UserSelectExperience({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        UserStepProvider.of(context).userStepController;

    return UserStepBuilder(
      title: UserAdditionalInformationStepEnum
          .experience.title,
      subtitle: UserAdditionalInformationStepEnum
          .experience.subtitle,
      body: ValueListenableBuilder(
        valueListenable: controller.values,
        builder: (context, value, child) {
          print(value[UserAdditionalInformationStepEnum
              .experience.value]);
          return SegmentedButton(
            style: ButtonStyle(
              iconColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
            ),
            segments: [
              ButtonSegment(
                value: UserExperience.BEGINNER.value,
                label: const Text(
                  'Iniciante',
                ),
              ),
              ButtonSegment(
                value: UserExperience.INTERMEDIATE.value,
                label: const GymText(
                  'Intermediário',
                  size: TextSizeEnum.small,
                ),
              ),
              ButtonSegment(
                value: UserExperience.ADVANCED.value,
                label: const GymText(
                  'Avançado',
                  size: TextSizeEnum.small,
                ),
              ),
            ],
            onSelectionChanged: (value) {
              controller.updateValue(
                  UserAdditionalInformationStepEnum
                      .experience.value,
                  value);
            },
            selected:
              value[UserAdditionalInformationStepEnum
                  .experience.value]
            ,
          );
        },
      ),
      previousStep: controller.previousStep,
      nextStep: controller.nextStep,
    );
  }
}

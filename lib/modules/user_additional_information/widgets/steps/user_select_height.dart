import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/user_additional_information/enums/user_additional_information_step_enum.dart';
import 'package:flutter_gym_app/modules/user_additional_information/provider/user_step_provider.dart';
import 'package:flutter_gym_app/modules/user_additional_information/widgets/user_step_builder.dart';
import 'package:flutter_gym_app/shared/widgets/gym_vertical_number_scroll.dart';

class UserSelectHeight extends StatelessWidget {
  const UserSelectHeight({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserStepProvider.of(context).userStepController;

    return UserStepBuilder(
      title: UserAdditionalInformationStepEnum.height.title,
      subtitle: UserAdditionalInformationStepEnum.height.subtitle,
      body: GymVerticalNumberScroll(
        minValue: 0,
        maxValue: 200,
        initialValue: 18,
        onValueChanged: (value) {},
      ),
      previousStep: controller.previousStep,
      nextStep: controller.nextStep,
    );
  }
}
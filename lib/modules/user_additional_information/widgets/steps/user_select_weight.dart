import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/user_additional_information/enums/user_additional_information_step_enum.dart';
import 'package:flutter_gym_app/modules/user_additional_information/provider/user_step_provider.dart';
import 'package:flutter_gym_app/modules/user_additional_information/widgets/user_step_builder.dart';
import 'package:flutter_gym_app/shared/widgets/gym_input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserSelectWeight extends StatelessWidget {
  const UserSelectWeight({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserStepProvider.of(context).userStepController;

    return UserStepBuilder(
      title: UserAdditionalInformationStepEnum.weight.title,
      subtitle: UserAdditionalInformationStepEnum.weight.subtitle,
      body: GymInput(
        maxLength: 5,
        controller: TextEditingController(),
        keyboardType: TextInputType.number,
        prefixIcon: FontAwesomeIcons.weightHanging,
        hintText: 'Peso em kg',
      ),
      previousStep: controller.previousStep,
      nextStep: controller.nextStep,
    );
  }
}

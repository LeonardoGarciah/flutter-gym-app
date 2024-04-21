import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/user_additional_information/controllers/user_step_controller.dart';
import 'package:flutter_gym_app/modules/user_additional_information/enums/user_additional_information_step_enum.dart';
import 'package:flutter_gym_app/modules/user_additional_information/provider/user_step_provider.dart';
import 'package:flutter_gym_app/modules/user_additional_information/widgets/steps/user_select_experience.dart';
import 'package:flutter_gym_app/modules/user_additional_information/widgets/steps/user_select_height.dart';
import 'package:flutter_gym_app/modules/user_additional_information/widgets/steps/user_select_weight.dart';
import 'package:flutter_gym_app/modules/user_additional_information/widgets/steps/user_select_years_old.dart';
import 'package:flutter_gym_app/shared/widgets/gym_scaffold.dart';

class UserAdditionalInformationPage extends StatelessWidget {
  const UserAdditionalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserStepController userStepController = UserStepController();

    Widget getStep() {
      switch (userStepController.currentStep.value) {
        case UserAdditionalInformationStepEnum.yearsOld:
          return const UserSelectYearsOld();
        case UserAdditionalInformationStepEnum.height:
          return const UserSelectHeight();
        case UserAdditionalInformationStepEnum.weight:
          return const UserSelectWeight();
        case UserAdditionalInformationStepEnum.experience:
          return const UserSelectExperience();
      }
    }

    return GymScaffold(
      body: UserStepProvider(
        userStepController,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ValueListenableBuilder(
              valueListenable: userStepController.currentStep,
              builder: (context, value, child) {
                return AnimatedSwitcher(duration: const Duration(milliseconds: 300), child: getStep());
              }),
        ),
      ),
    );
  }
}

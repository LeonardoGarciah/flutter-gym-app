import 'package:flutter/cupertino.dart';
import 'package:flutter_gym_app/modules/user_additional_information/enums/user_additional_information_step_enum.dart';

class UserStepController {
  final currentStep = ValueNotifier<UserAdditionalInformationStepEnum>(UserAdditionalInformationStepEnum.yearsOld);

  final  values = ValueNotifier<Map<String, dynamic>>({
    UserAdditionalInformationStepEnum.yearsOld.value: 18,
    UserAdditionalInformationStepEnum.height.value: 0,
    UserAdditionalInformationStepEnum.weight.value: 0,
    UserAdditionalInformationStepEnum.experience.value: {''},
  });

  void previousStep() {
    currentStep.value = currentStep.value.previousStep;
  }

  void nextStep() {
    currentStep.value = currentStep.value.nextStep;
  }

  void updateValue(String key, dynamic value) {
    values.value = {
      ...values.value,
      key: value,
    };
  }
}
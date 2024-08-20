import 'package:flutter/cupertino.dart';
import 'package:flutter_gym_app/modules/home/views/home_page.dart';
import 'package:flutter_gym_app/modules/user_additional_information/enums/user_additional_information_step_enum.dart';
import 'package:flutter_gym_app/shared/domain/user_domain.dart';
import 'package:flutter_gym_app/shared/repositories/bloc/user_bloc/user_bloc.dart';
import 'package:flutter_gym_app/shared/repositories/http/user/dtos/update_user_dto.dart';
import 'package:flutter_gym_app/shared/repositories/http/user/user_repository.dart';
import 'package:flutter_gym_app/shared/services/get_service.dart';

class UserStepController {
  late UserRepository _userRepository;

  UserStepController([UserRepository? userRepository]) {
    _userRepository = userRepository ?? UserRepository();
  }

  final currentStep = ValueNotifier<UserAdditionalInformationStepEnum>(UserAdditionalInformationStepEnum.yearsOld);

  final values = ValueNotifier<Map<String, dynamic>>({
    UserAdditionalInformationStepEnum.yearsOld.value: 18,
    UserAdditionalInformationStepEnum.height.value: 0,
    UserAdditionalInformationStepEnum.weight.value: 0,
    UserAdditionalInformationStepEnum.experience.value: {''},
  });

  void previousStep() {
    currentStep.value = currentStep.value.previousStep;
  }

  void nextStep() {
    if (currentStep.value == UserAdditionalInformationStepEnum.experience) {
      finish();
      return;
    }

    currentStep.value = currentStep.value.nextStep;
  }

  void finish() async {
    UpdateUserDto updateUserDto = UpdateUserDto(
      yearsOld: (values.value[UserAdditionalInformationStepEnum.yearsOld.value.toString()] as int).toDouble(),
      height: (values.value[UserAdditionalInformationStepEnum.height.value.toString()] as int).toDouble(),
      weight: values.value[UserAdditionalInformationStepEnum.weight.value.toString()],
      // get experience from set and transform to string
      experience: values.value[UserAdditionalInformationStepEnum.experience.value.toString()].join(','),
      firstAccess: false,
    );

    try {
      await _userRepository.updateUser(updateUserDto);

      UserBloc userBloc = GetService.getBloc(() => UserBloc());

      userBloc.add(
        UserBlocEventUpdateUser(
          UserDomain(firstAccess: false),
        ),
      );

      GetService.snackbarSuccess('Informações atualizadas com sucesso!');

      GetService.off(() => const HomePage());
    } catch (e) {
      print(e);
    }
  }

  void updateValue(String key, dynamic value) {
    values.value = {
      ...values.value,
      key: value,
    };
  }
}

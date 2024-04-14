enum UserAdditionalInformationStepEnum {
  yearsOld,
  height,
  weight,
  experience,
}

extension UserAdditionalInformationStepValueExtension on UserAdditionalInformationStepEnum {
  String get value {
    switch (this) {
      case UserAdditionalInformationStepEnum.yearsOld:
        return 'yearsOld';
      case UserAdditionalInformationStepEnum.height:
        return 'height';
      case UserAdditionalInformationStepEnum.weight:
        return 'weight';
      case UserAdditionalInformationStepEnum.experience:
        return 'experience';
    }
  }
}

extension UserAdditionalInformationStepExtension on UserAdditionalInformationStepEnum {
  String get title {
    switch (this) {
      case UserAdditionalInformationStepEnum.yearsOld:
        return 'Qual a sua idade?';
      case UserAdditionalInformationStepEnum.height:
        return 'Qual a sua altura?';
      case UserAdditionalInformationStepEnum.weight:
        return 'Qual o seu peso?';
      case UserAdditionalInformationStepEnum.experience:
        return 'Nível de atividade física?';
    }
  }
}

extension UserAdditionalInformationStepSubtitleExtension on UserAdditionalInformationStepEnum {
  String get subtitle {
    switch (this) {
      case UserAdditionalInformationStepEnum.yearsOld:
        return 'A sua idade, é utilizada para calcular o seu plano de treino.';
      case UserAdditionalInformationStepEnum.height:
        return 'Altura em cm, Não se preocupe, você pode alterar depois.';
      case UserAdditionalInformationStepEnum.weight:
        return 'Peso em kg, não se preocupe, você pode alterar seu peso depois.';
      case UserAdditionalInformationStepEnum.experience:
        return 'Selecione o seu nível de atividade física.';
    }
  }
}

extension UserAdditionalInformationStepNextStepExtension on UserAdditionalInformationStepEnum {
  UserAdditionalInformationStepEnum get nextStep {
    switch (this) {
      case UserAdditionalInformationStepEnum.yearsOld:
        return UserAdditionalInformationStepEnum.height;
      case UserAdditionalInformationStepEnum.height:
        return UserAdditionalInformationStepEnum.weight;
      case UserAdditionalInformationStepEnum.weight:
        return UserAdditionalInformationStepEnum.experience;
      case UserAdditionalInformationStepEnum.experience:
        return UserAdditionalInformationStepEnum.yearsOld;
    }
  }
}

extension UserAdditionalInformationStepPreviousStepExtension on UserAdditionalInformationStepEnum {
  UserAdditionalInformationStepEnum get previousStep {
    switch (this) {
      case UserAdditionalInformationStepEnum.yearsOld:
        return UserAdditionalInformationStepEnum.experience;
      case UserAdditionalInformationStepEnum.height:
        return UserAdditionalInformationStepEnum.yearsOld;
      case UserAdditionalInformationStepEnum.weight:
        return UserAdditionalInformationStepEnum.height;
      case UserAdditionalInformationStepEnum.experience:
        return UserAdditionalInformationStepEnum.weight;
    }
  }
}
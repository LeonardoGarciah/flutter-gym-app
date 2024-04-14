enum ButtonTypeEnum {
  elevated,
  text,
}

extension ButtonTypeEnumExtension on ButtonTypeEnum {
  String get value {
    switch (this) {
      case ButtonTypeEnum.elevated:
        return 'elevated';
      case ButtonTypeEnum.text:
        return 'text';
      default:
        return '';
    }
  }
}
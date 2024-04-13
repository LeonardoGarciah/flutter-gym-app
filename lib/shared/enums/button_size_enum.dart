enum ButtonSizeEnum {
  small,
  medium,
  large,
}

extension ButtonSizeEnumExtension on ButtonSizeEnum {
  double get value {
    switch (this) {
      case ButtonSizeEnum.small:
        return 32.0;
      case ButtonSizeEnum.medium:
        return 40.0;
      case ButtonSizeEnum.large:
        return 48.0;
    }
  }
}
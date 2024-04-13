enum TextSizeEnum {
  small,
  medium,
  large,
}

extension TextSizeEnumExtension on TextSizeEnum {
  double get value {
    switch (this) {
      case TextSizeEnum.small:
        return 16.0;
      case TextSizeEnum.medium:
        return 24.0;
      case TextSizeEnum.large:
        return 48.0;
    }
  }
}
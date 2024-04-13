import 'package:flutter/material.dart';
import 'package:flutter_gym_app/shared/utils/color_utils.dart';

ColorScheme getColorScheme() {
  return ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
    primary: ColorUtils.hexOrRGBToColor('#6842FF'),
    secondary: ColorUtils.hexOrRGBToColor('#573BCA'),
    tertiary: ColorUtils.hexOrRGBToColor('#4CAF50'),
    surface: Colors.white,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  );
}

ThemeData getAppTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: getColorScheme(),
    disabledColor: ColorUtils.hexOrRGBToColor('#808080'),
    fontFamily: "Montserrat",
    useMaterial3: true,
  );
}
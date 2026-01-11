import 'package:flutter/material.dart';

extension CustomTheme on ThemeData {
  CustomColors get colors =>
      CustomColors(isDarkMode: brightness == Brightness.dark);
}

class CustomColors {
  static const Color white = Colors.white;
  static const Color darkBlue =  Color.fromARGB(255, 2, 5, 10);
  static const Color lightGrey100 = Color(0xffF6F6F6);
  static const Color platinum100 = Color(0xff737171);
  static const Color silver100 = Color(0xFFC4C4C4);
  static const Color lightBlue = Colors.lightBlue;
  static const Color green = Color(0xFF2A9D8F);
  static const Color grey = Color(0xff5B5B5B);
  static const Color red = Color(0xFFD60019);
  static const Color yellow = Color(0xffFFC107);
  static const Color silver = Color(0xFFC0C0C0); // Silver
  static const Color platinum = Color(0xfff9f9f9); // Platinum
  static const Color lightGrey = Color(0xFFD3D3D3);
  static const Color warmTeracotta = Color(0xffD87C5A);
  static const Color dustyPurple = Color(0xff6D6875);
  static const Color accentAmber = Color(0xffF4A261);
  static const Color golden = Color(0xffC9A227);
  static const Color darkGolden = Color(0xff9E8210);

  static const Color offWhite = Color(0xffFAF9F6);
  static const Color deepgrey = Color(0xff3D405B);

  static const Color black = Colors.black;

  final bool isDarkMode;

  CustomColors({required this.isDarkMode});

  Color get colorWhite => isDarkMode ? black : white;
  Color get colorBlack => isDarkMode ? white : black;
  Color get defaultWhite => white;
  Color get defaultBlack => black;
  Color get colorBlue => darkBlue;
  Color get colorLightGrey => isDarkMode ? grey : lightGrey;
  Color get colorPlatinum => platinum;
  Color get colorSilver => silver;
  Color get colorLightGrey100 => isDarkMode ? platinum100 : lightGrey100;
  Color get colorPlatinum100 => platinum100;
  Color get colorSilver100 => silver100;
  Color get colorGreen => green;
  Color get colorRed => red;
  Color get colorGrey => isDarkMode ? white : grey;
  Color get colorLightBlue => isDarkMode ? lightBlue : lightBlue;
  Color get dividerGrey => isDarkMode ? lightGrey100 : lightGrey;
  Color get lightBlueText => isDarkMode ? white : lightBlue;
  Color get bottomTabGrey => isDarkMode ? white : silver;
  Color get selectedShiftColor => Colors.yellow.shade100;
  Color get appbarColor => lightBlue;
  Color get dustyColor => dustyPurple;
  Color get bgColor => offWhite;
  Color get orangeColor => warmTeracotta;
  Color get darkBlueColor => darkBlue;

  Color get offWhiteBg => const Color.fromARGB(255, 255, 251, 251);

  Brightness get iconBrightness =>
      isDarkMode ? Brightness.light : Brightness.dark;
}

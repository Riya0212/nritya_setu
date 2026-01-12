import 'package:flutter/material.dart';
import 'package:nritya_setu/constants/colors.dart';

import '../../Constants/index.dart';

class Styles {
  Styles._();

  static TextStyle hintStyle(BuildContext context) {
    return const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400);
  }

  static TextStyle errorStyle(BuildContext context) {
    return TextStyle(
      color: Colors.red,
      fontSize: Metrics.getFontSize(
        context,
        (Metrics.isTablet(context) && !Metrics.isPortrait(context)) ? 10 : 14,
      ),
    );
  }

  static OutlineInputBorder borderStyle(BuildContext context) =>
      OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 0.1),
        borderRadius: BorderRadius.circular(Metrics.doubleButtonRadius),
      );

  static OutlineInputBorder focusedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colors.colorLightBlue,
        width: 0.1,
      ),
      borderRadius: BorderRadius.circular(Metrics.doubleButtonRadius),
    );
  }

  static TextStyle titleText(BuildContext context) {
    return TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w400,
      fontSize: Metrics.getFontSize(
        context,
        (Metrics.isTablet(context) && !Metrics.isPortrait(context)) ? 25 : 16,
      ),
    );
  }

  static TextStyle subText(BuildContext context) {
    return const TextStyle(color: Colors.red);
  }

  static OutlineInputBorder errorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),

      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    );
  }

  static TextStyle inputTextStyle(BuildContext context) =>
      TextStyle(color: Theme.of(context).colors.colorBlack);
}

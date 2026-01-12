import 'package:flutter/material.dart';
import 'package:nritya_setu/constants/colors.dart';

import '../../constants/index.dart';


class Styles {
  Styles._();
  static textstyle(BuildContext context) {
    final isTablet = Metrics.isTablet(context);
    final isPortrait = Metrics.isPortrait(context);
    return TextStyle(
      color: Theme.of(context).colors.colorBlack,
      fontSize: isTablet
          ? Metrics.getFontSize(context, 10)
          : Metrics.getFontSize(context, 14),
    );
  }
}

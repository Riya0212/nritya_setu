import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:math';

class Metrics {
  Metrics._();

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static const double marginHorizontal = 10.0;
  static const double marginVertical = 10.0;
  static const double section = 25.0;
  static const double baseMargin = 10.0;
  static const double doubleBaseMargin = 20.0;
  static const double tripleBaseMargin = 30.0;
  static const double extraSmallMargin = 3.0;
  static const double smallMargin = 5.0;
  static const double doubleSection = 50.0;
  static const double horizontalLineHeight = 1.0;
  static const double semiBaseMargin = 15.0;
  static const double iconSize = 18.0;

  static double screenWidth(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width < size.height ? size.width : size.height;
  }

  static double screenHeight(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width < size.height ? size.height : size.width;
  }

  static double navBarHeight(BuildContext context) {
    return Platform.isIOS ? 64.0 : 54.0;
  }

  static const double buttonRadius = 4.0;
  static const double borderRadius = 5.0;
  static const double doubleButtonRadius = 8.0;
  static const double doubleBorderRadius = 10.0;

  static const icons = {
    'tiny': 15.0,
    'small': 20.0,
    'medium': 30.0,
    'large': 45.0,
    'xl': 50.0,
  };

  static const images = {
    'small': 20.0,
    'medium': 40.0,
    'large': 60.0,
    'logo': 200.0
  };

  // static bool isTablet(BuildContext context) {
  //   return ScreenUtil().deviceType(context) == DeviceType.tablet;
  // }

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= 600;

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }

  // static double getResponsiveSize(BuildContext context, double baseSize,
  //     {bool? isOpposite}) {
  //   double screenSize = 0.0;
  //   if (isOpposite != null) {
  //     if (isOpposite == true) {
  //       screenSize = isPortrait(context)
  //           ? MediaQuery.of(context).size.height
  //           : MediaQuery.of(context).size.width;
  //     } else {
  //       screenSize = isPortrait(context)
  //           ? MediaQuery.of(context).size.width
  //           : MediaQuery.of(context).size.height;
  //     }
  //   } else {
  //     screenSize = isPortrait(context)
  //         ? MediaQuery.of(context).size.width
  //         : MediaQuery.of(context).size.height;
  //   }

  //   return screenSize * baseSize;
  // }

  // static double getFontSize(BuildContext context, double baseFontSize) {
  //   dev.log('potraitt-->${isPortrait(context)}');
  //   double screenSize = isPortrait(context)
  //       ? MediaQuery.of(context).size.width
  //       : MediaQuery.of(context).size.height;
  //   double baseScreenWidth = 375.0;
  //   const double baseTabletWidth = 768.0;

  //   double scaleFactor = screenSize / baseScreenWidth;
  //   return baseFontSize * scaleFactor;
  // }

  static double getResponsiveSize(BuildContext context, double baseSize,
      {bool? isOpposite}) {
    // Get the screen size and orientation
    double screenSize = 0.0;

    // Handle when `isOpposite` is provided (for opposite orientation logic)
    if (isOpposite != null) {
      if (isOpposite == true) {
        // If isOpposite is true, swap the screen width and height based on orientation
        screenSize = isPortrait(context)
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.width;
      } else {
        // If isOpposite is false, maintain standard orientation-based logic
        screenSize = isPortrait(context)
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
      }
    } else {
      // If isOpposite is not passed, fall back to default logic
      screenSize = isPortrait(context)
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.height;
    }

    // Scale the baseSize based on the screen dimension
    return screenSize * baseSize;
  }

  // Helper function to check if the device is in landscape mode
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static double getFontSize(BuildContext context, double baseFontSize) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final isTablet = mediaQuery.size.shortestSide >= 600;
    final userScale = mediaQuery.textScaleFactor;

    final screenSize =
        isPortrait ? mediaQuery.size.width : mediaQuery.size.width;

    // Base widths for scaling reference
    const double basePhoneWidth = 375.0;
    const double baseTabletWidth = 768.0;

    // Choose the appropriate base width
    final scaleBase = isTablet ? baseTabletWidth : basePhoneWidth;

    // Scale font size based on screen size
    double scaleFactor = screenSize / scaleBase;
    double scaledFont = baseFontSize * scaleFactor;

    // Apply user text scaling (from device settings)
    double userScaledFont = scaledFont * userScale;

    // Clamp font size to keep it within a readable range
    return isTablet
        ? userScaledFont.clamp(baseFontSize * 1.0, baseFontSize * 1.8)
        : userScaledFont.clamp(baseFontSize * 0.85, baseFontSize * 1.4);
  }
}

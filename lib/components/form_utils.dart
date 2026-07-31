import 'package:flutter/material.dart';
import 'package:nritya_setu/components/textFormField/text_form_field_component.dart';
import 'package:nritya_setu/constants/colors.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../constants/index.dart';
import 'index.dart';

Widget buildTextField({
  required String hint,
  required BuildContext context,
  int? maxlines,
  TextEditingController? controller,
  String? initialValue,
  String? suffixText,
  Key? currentKey,
  String? maxValue,
  TextStyle? suffixTextStyle,
  required TextInputType keyboardType,
  required String validationLabel,
  ValueChanged<String>? onChanged,
  TextSelectionControls? textSelectionControls,
  TextInputAction? textInputAction,
  FocusNode? focusNode,
  VoidCallback? onTap,
  bool? isRequired,
  Widget? prefixICon,
  bool? isReadOnly,
  bool? isAllowed,
  String? title,
  TextStyle? titleTextStyle,
  OutlineInputBorder? enabledBorder,
  OutlineInputBorder? focusedBorder,
  bool? autoFocus,
  bool? obscureText,
  Widget? suffixIcon,
  bool? isMultiline,
  int? maxLength,

  // 🔽 New dynamic parameters
  AutovalidateMode? autovalidateMode,
  FormFieldValidator<String>? validator,
}) {
  final colors = Theme.of(context).colors;

  return TextFormFieldComponent(
    key: currentKey,
    isRequired: isRequired ?? false,
    controller: controller,
    isReadOnly: isReadOnly ?? false,
    title: title,
    titleTextStyle:
        titleTextStyle ??
        TextStyle(
          color: colors.colorBlack,
          fontSize: Metrics.getFontSize(context, 15.5),
          fontWeight: FontWeight.bold,
        ),
    maxLines: maxlines,
    focusNode: focusNode,
    initialValue: initialValue,
    onTap: onTap,
    maxLength: maxLength,
    keyboardType: keyboardType,
    obscureText: obscureText,
    // 🔽 Dynamic autovalidateMode with fallback
    autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,

    textAlign: TextAlign.center,
    inputTextStyle: TextStyle(
      color: colors.colorBlack,
      fontSize:
          Metrics.isTablet(context)
              ? Metrics.getFontSize(context, 10)
              : Metrics.getFontSize(context, 14),
    ),
    isFilled: true,
    fillColor: isAllowed == false ? colors.dividerGrey : colors.colorWhite,
    hintText: hint,
    prefixIcon: prefixICon,

    suffixIcon: suffixIcon,
    textInputAction: textInputAction ?? TextInputAction.next,
    hintStyle: TextStyle(
      color: colors.isDarkMode ? Colors.white : Colors.grey,
      fontWeight: FontWeight.normal,
      fontSize:
          Metrics.isTablet(context)
              ? Metrics.getFontSize(context, 10)
              : Metrics.getFontSize(context, 14),
    ),
    onChanged: onChanged,

    // 🔽 Dynamic validator with fallback
    validator: validator,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),
      borderSide: BorderSide(color: colors.colorLightGrey),
    ),
    focusedBorder:
        focusedBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),
          borderSide: BorderSide(
            color:
                isAllowed == false ? colors.colorLightGrey : colors.appbarColor,
          ),
        ),
    enabledBorder:
        enabledBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),
          borderSide: BorderSide(color: colors.colorLightGrey),
        ),

    contentPadding:
        Metrics.isTablet(context)
            ? EdgeInsets.only(
              left: Metrics.height(context) * 0.005,
              right: Metrics.width(context) * 0.02,
              top: Metrics.height(context) * 0.01,
              bottom: Metrics.height(context) * 0.01,
            )
            : EdgeInsets.only(
              right: Metrics.width(context) * 0.0,
              top: Metrics.width(context) * 0.01,
              bottom: Metrics.width(context) * 0.01,
            ),
  );
}

Widget buildBtn({
  required BuildContext context,
  required String title,
  required VoidCallback onTap,
  Color backgroundColor = Colors.amber,
  Color textColor = Colors.white,
  double? width,
}) {
  final colors = Theme.of(context).colors;
  return InkWell(
    borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),
    onTap: onTap,
    child: Container(
      width: width ?? double.infinity,
      padding: EdgeInsets.all(Metrics.width(context) * 0.03),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: colors.colorLightGrey.withAlpha(50),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(2, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),
      ),
      alignment: Alignment.center,
      child: TextComponent(
        text: title,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: Metrics.getFontSize(context, 20),
        ),
      ),
    ),
  );
}


Widget buildChildBtn({
  required BuildContext context,
  required String title,
  required VoidCallback onTap,
  Color backgroundColor = Colors.amber,
  Color textColor = Colors.white,
  double? width,
}) {
  final colors = Theme.of(context).colors;
  return InkWell(
    borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),
    onTap: onTap,
    child: Container(
      width: width ?? double.infinity,
      padding: EdgeInsets.all(Metrics.width(context) * 0.025),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: colors.colorLightGrey.withAlpha(50),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(2, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(Metrics.height(context) * 0.015),
      ),
      alignment: Alignment.center,
      child: TextComponent(
        text: title,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: Metrics.getFontSize(context, 18),
        ),
      ),
    ),
  );
}

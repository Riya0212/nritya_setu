import 'package:flutter/material.dart';
import 'package:nritya_setu/constants/colors.dart';
import '../../constants/index.dart';
import 'styles.dart';

/******************** Constants ********************/

/******************** Styles ********************/

class TextFormFieldComponent extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final String? hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final InputBorder? focusedBorder;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final InputBorder? border;
  final OutlineInputBorder? enabledBorder;
  final TextAlign? textAlign;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final Color? focusColor;
  final String? errorText;
  final String? Function(String?)? validator;
  final SizedBox? containerSize;
  final bool isRequired;
  final String? title;
  final TextStyle? inputTextStyle;
  final Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final bool? isReadOnly;
  final bool? isFilled;
  final Color? fillColor;
  final void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final String? initialValue;
  final TextStyle? titleTextStyle;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? hasTopPadding;
  final GlobalKey<FormFieldState>? fieldKey;

  const TextFormFieldComponent({
    super.key,
    this.controller,
    this.keyboardType,
    this.focusNode,
    this.onFieldSubmitted,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.hintStyle,
    this.focusedBorder,
    this.suffixIcon,
    this.suffixIconColor,
    this.prefixIcon,
    this.prefixIconColor,
    this.border,
    this.enabledBorder,
    this.textAlign,
    this.obscureText,
    this.textInputAction,
    this.focusColor,
    this.errorText,
    this.validator,
    this.containerSize,
    required this.isRequired,
    this.title,
    this.inputTextStyle,
    this.onChanged,
    this.autovalidateMode,
    this.isReadOnly,
    this.isFilled,
    this.fillColor,
    this.onTap,
    this.contentPadding,
    this.initialValue,
    this.titleTextStyle,
    this.maxLines,
    this.hasTopPadding = true,
    this.minLines,
    this.maxLength,
    this.fieldKey,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = Metrics.isTablet(context);
    final isPortrait = Metrics.isPortrait(context);
    final colors = Theme.of(context).colors;

    return Container(
      alignment: Alignment.center,
      width: containerSize?.width,
      // height: containerSize?.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Padding(
                  padding: hasTopPadding == true
                      ? EdgeInsets.only(
                          top: Metrics.getResponsiveSize(context, 0.01),
                          bottom: Metrics.getResponsiveSize(context, 0.02),
                        )
                      : EdgeInsets.only(
                          bottom: Metrics.getResponsiveSize(context, 0.02),
                        ),
                  child: RichText(
                    textScaler: isTablet == true
                        ? isPortrait
                              ? const TextScaler.linear(0.6)
                              : const TextScaler.linear(0.4)
                        : const TextScaler.linear(1),
                    text: TextSpan(
                      text: title,
                      style:
                          titleTextStyle ??
                          Styles.titleText(context).copyWith(
                            fontSize: Metrics.getFontSize(
                              context,
                              isTablet && !isPortrait ? 25 : 16,
                            ),
                          ),
                      children: [
                        isRequired
                            ? TextSpan(
                                text: '*',
                                style: Styles.subText(context),
                              )
                            : const TextSpan(),
                      ],
                    ),
                  ),
                )
              : Container(),
          TextFormField(
            key: fieldKey,
            controller: controller,
            initialValue: initialValue,
            keyboardType: keyboardType,
            focusNode: focusNode,
            textAlign: TextAlign.left,
            onTap: onTap,
            textInputAction: textInputAction,
            obscureText: obscureText ?? false,
            cursorColor: colors.colorBlack,
            onFieldSubmitted: onFieldSubmitted,
            validator: validator,
            style: inputTextStyle,
            onChanged: onChanged,
            autovalidateMode: autovalidateMode,
            readOnly: isReadOnly ?? false,
            minLines: minLines,
            maxLines: maxLines ?? null,
            maxLength: maxLength,
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              fillColor: fillColor,
              filled: isFilled,
              hintStyle: hintStyle,
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              errorStyle: isTablet == true
                  ? Styles.errorStyle(context).copyWith(
                      fontSize: Metrics.getFontSize(
                        context,
                        isTablet && !isPortrait ? 10 : 9,
                      ),
                    )
                  : Styles.errorStyle(context),
              border: border,
              enabledBorder: enabledBorder,
              focusedBorder: focusedBorder,
              errorBorder: Styles.errorBorder(context),
              focusedErrorBorder: Styles.errorBorder(context),
              focusColor: focusColor,
              suffixIcon: suffixIcon,
              suffixIconColor: suffixIconColor ?? Colors.black,
              hoverColor: Colors.black,
              prefixIcon: prefixIcon,
              prefix: prefixIcon == null
                  ? Padding(
                      padding: EdgeInsets.only(
                        left: Metrics.smallMargin,
                        right: Metrics.baseMargin,
                      ),
                    )
                  : null,
              contentPadding:
                  contentPadding ??
                  (maxLines != 1
                      ? const EdgeInsets.only(top: 5)
                      : const EdgeInsets.only(left: 0, right: 5)),
              prefixIconColor: prefixIconColor,
            ),
          ),
        ],
      ),
    );
  }
}

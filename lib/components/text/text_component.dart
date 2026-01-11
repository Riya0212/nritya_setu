import 'package:flutter/material.dart';

import '../../constants/index.dart';
import 'styles.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxlines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextScaler? textScaleFactor;

  const TextComponent({
    super.key,
    required this.text,
    this.style,
    this.maxlines,
    this.textAlign,
    this.overflow,
    this.textScaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = Metrics.isTablet(context);
    final isPortrait = Metrics.isPortrait(context);
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxlines,
      overflow: overflow,
      textScaler:
          textScaleFactor ??
          (isTablet == true
              ? isPortrait
                    ? const TextScaler.linear(1)
                    : const TextScaler.linear(0.4)
              : const TextScaler.linear(1)),
      style:
          style?.copyWith(
            color: style?.color,
            fontSize: style?.fontSize ?? Styles.textstyle(context).fontSize,
            fontFamily: style?.fontFamily,
            fontWeight: style?.fontWeight,
            wordSpacing: style?.wordSpacing,
            letterSpacing: style?.letterSpacing,
            overflow: style?.overflow,
          ) ??
          Styles.textstyle(context),
    );
  }
}

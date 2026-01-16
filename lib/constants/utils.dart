import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nritya_setu/constants/colors.dart';

import 'metrics.dart';

String generateAlphanumericSessionId(int length) {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random.secure();
  return List.generate(
    length,
    (index) => chars[random.nextInt(chars.length)],
  ).join();
}

String escapeHtmlSpecialChars(String input) {
  // return input.replaceAll("'", r"\\'").replaceAll('"', r'\"');
  return input;
}

String escapeSingleQuotes(String input) {
  return input.replaceAll("'", r"\'").replaceAll('"', r'\"');
}

int compareEmployeeIds(String id1, String id2) {
  final prefix1 = RegExp(r'^[A-Z]+').stringMatch(id1) ?? '';
  final prefix2 = RegExp(r'^[A-Z]+').stringMatch(id2) ?? '';

  final num1 = int.parse(RegExp(r'\d+').firstMatch(id1)!.group(0)!);
  final num2 = int.parse(RegExp(r'\d+').firstMatch(id2)!.group(0)!);

  final prefixCompare = prefix1.compareTo(prefix2);
  if (prefixCompare != 0) return prefixCompare;

  return num1.compareTo(num2);
}

Future<String> getReadableFileSize(File file) async {
  int bytes = await file.length();

  if (bytes < 1024)
    return '$bytes B';
  else if (bytes < 1024 * 1024)
    return '${(bytes / 1024).toStringAsFixed(2)} KB';
  else
    return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
}

bool isPdf(File fileName) {
  return fileName.path.toLowerCase().endsWith('.pdf');
}

String generateRandomFileName({int length = 10}) {
  const chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final rand = Random();
  return List.generate(
    length,
    (index) => chars[rand.nextInt(chars.length)],
  ).join();
}

PreferredSizeWidget buildCustomAppBar(
  BuildContext context,
  String title, {
  VoidCallback? onBackPress,
  PreferredSizeWidget? customBottom,
  Widget? customLeading,
  Widget? customTitle,
  bool hasLeading = true,
  double? customHeight,
  List<Widget>? actions,
  bool isLeadingClickable = true,
  String? topImage,
  double? top,
  double? leadingWidth,
}) {
  final colors = Theme.of(context).colors;

  return PreferredSize(
    preferredSize: Size.fromHeight(
      customHeight ?? Metrics.height(context) * 0.055,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(Metrics.height(context) * 0.02),
        bottomRight: Radius.circular(Metrics.height(context) * 0.02),
      ),
      child: Stack(
        children: [
          // 🌈 Gradient background layer
          Container(
            decoration: BoxDecoration(
              // color: colors.appbarColor,
              gradient: LinearGradient(
                colors:
                    colors.isDarkMode
                        ? [
                          Colors.blue.shade300,
                          Colors.blue.shade400,
                          Colors.blue.shade600,
                          Colors.blue.shade600,
                        ]
                        :colors.marronBg,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 📷 Optional decorative image
          topImage != null && topImage != ''
              ? Positioned(
                bottom:
                    top ??
                    (Metrics.isTablet(context) == true
                        ? -Metrics.width(context) * 0.03
                        : -Metrics.height(context) * 0.03),
                right: -5,
                child: Image.asset(
                  topImage,
                  width: Metrics.height(context) * 0.12,
                  height: Metrics.height(context) * 0.12,
                ),
              )
              : Container(),

          AppBar(
            backgroundColor: Colors.transparent, // Make it transparent
            elevation: 0, // Remove shadow
            leadingWidth:
                hasLeading
                    ? leadingWidth ??
                        (Metrics.isTablet(context)
                            ? Metrics.width(context) * 0.08
                            : Metrics.width(context) * 0.12)
                    : Metrics.width(context) * 0.03,
            leading:
                hasLeading
                    ? isLeadingClickable == true
                        ? InkWell(
                          onTap:
                              onBackPress ??
                              () => {
                                //go back
                                context.pop(),
                              },
                          child:
                              customLeading ??
                              Icon(
                                Icons.arrow_back_ios_new_sharp,
                                color: colors.defaultWhite,
                                size: Metrics.height(context) * 0.03,
                              ),
                        )
                        : customLeading
                    : SizedBox(width: Metrics.width(context) * 0.03),

            titleSpacing:
                Metrics.isTablet(context) ? 0 : Metrics.height(context) * 0.01,
            title:
                customTitle ??
                Text(
                  title,
                  style: TextStyle(
                    fontSize:
                        Metrics.isTablet(context)
                            ? Metrics.getFontSize(context, 21)
                            : Metrics.getFontSize(context, 20),
                    color: Colors.white,
                  ),
                ),
            bottom: customBottom,
            actions: actions,
          ),
        ],
      ),
    ),
  );
}

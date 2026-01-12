import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../index.dart';

Future<DateTime?> selectDate(
  BuildContext context, {
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final isTablet = Metrics.isTablet(context);
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  final baseTextTheme = ThemeData.light().textTheme;

  final customTextTheme = baseTextTheme.copyWith(
    headlineLarge: baseTextTheme.headlineLarge?.copyWith(
      fontSize: Metrics.getFontSize(
        context,
        Metrics.isTablet(context) ? 10 : 22,
      ),
    ),
    headlineMedium: baseTextTheme.headlineMedium?.copyWith(
      fontSize: Metrics.getFontSize(
        context,
        Metrics.isTablet(context) ? 10 : 18,
      ),
    ),
    bodyLarge: baseTextTheme.bodyLarge?.copyWith(
      fontSize: Metrics.getFontSize(
        context,
        Metrics.isTablet(context) ? 10 : 16,
      ),
    ),
    labelLarge: baseTextTheme.labelLarge?.copyWith(
      fontSize: Metrics.getFontSize(
        context,
        Metrics.isTablet(context) ? 10 : 13,
      ),
    ),
  );

  // Define the custom text scaler based on your logic
  final textScaler = isTablet
      ? (isPortrait ? const TextScaler.linear(1) : const TextScaler.linear(0.4))
      : const TextScaler.linear(1.0);

  final pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime.now(),
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    lastDate: lastDate ?? DateTime(2030),
    builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: textScaler),
        child: Theme(
          data: ThemeData.light().copyWith(
            textTheme: customTextTheme,
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Metrics.isTablet(context)
                      ? Metrics.getFontSize(context, 13)
                      : Metrics.getFontSize(context, 14),
                ),
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: child,
          ),
        ),
      );
    },
  );

  return pickedDate; // <-- Return picked date
}

String checkAMorPM(String timeStr) {
  List<String> parts = timeStr.split(':');
  int hour = int.parse(parts[0]);

  if (hour == 12) {
    return 'PM'; // 12:00 is PM
  } else if (hour < 12) {
    return 'AM';
  } else {
    return 'PM';
  }
}

String getFormattedTime(TimeOfDay time) {
  final now = DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
  return DateFormat('hh:mm a').format(dt); // e.g., 01:30 PM
}

String formatTimeOfDay(TimeOfDay time) {
  final hours = time.hour.toString().padLeft(2, '0');
  final minutes = time.minute.toString().padLeft(2, '0');
  final seconds = '00'; // TimeOfDay does not have seconds, so default to 00
  return '$hours:$minutes:$seconds';
}

String mapToFormattedString(Map<dynamic, dynamic> map) {
  final entries = map.entries
      .map((e) {
        final key = e.key;
        final value = e.value;

        if (value is Map) {
          // Recursively format nested maps
          return "$key: ${mapToFormattedString(value)}";
        } else {
          final safeValue = escapeSingleQuotes(value.toString());
          return "$key:'$safeValue'";
        }
      })
      .join(", ");

  return "{$entries}";
}

bool isSameDate(DateTime d1, DateTime d2) {
  return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
}

DateTime parseDateTimeWithTime(String timeString, DateTime date) {
  if (timeString != '') {
    final parts = timeString.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    final second = int.parse(parts[2]);
    return DateTime(date.year, date.month, date.day, hour, minute, second);
  }
  return DateTime.now();
}

String calculateDateTimeDifference({
  required DateTime start,
  required DateTime end,
  required bool isDayBased, // true = day-based, false = time-based
}) {
  final difference = end.difference(start);

  if (isDayBased) {
    return '${difference.inDays} day(s)';
  } else {
    final hours = difference.inHours;
    final minutes = difference.inMinutes.remainder(60);
    final formatted =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} (HH:MM)';
    return formatted;
  }
}

String capitalizeFirstWord(String fullName) {
  if (fullName.isEmpty) return fullName;

  final firstWord = fullName.split(' ').first;
  if (firstWord.isEmpty) return '';

  return firstWord[0].toUpperCase() + firstWord.substring(1).toLowerCase();
}

bool compareDateTime(DateTime currentDate, DateTime baseDate) {
  var formattedCurrentDate = DateTime(
    currentDate.year,
    currentDate.month,
    currentDate.day,
  );
  var formattedBaseDate = DateTime(baseDate.year, baseDate.month, baseDate.day);

  return formattedBaseDate == formattedCurrentDate;
}

bool inDateRange(DateTime baseDate, DateTime startDate, DateTime endDate) {
  var formattedBaseDate = DateTime(baseDate.year, baseDate.month, baseDate.day);
  var formattedStartDate = DateTime(
    startDate.year,
    startDate.month,
    startDate.day,
  );
  var formattedEndDate = DateTime(endDate.year, endDate.month, endDate.day);

  return (formattedBaseDate.isAtSameMomentAs(formattedStartDate) ||
      formattedBaseDate.isAtSameMomentAs(formattedEndDate) ||
      (formattedBaseDate.isAfter(formattedStartDate) &&
          formattedBaseDate.isBefore(formattedEndDate)));
}

DateTime dateOnly(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

// String convertMinutesToHHMM(String totalMinutes) {
//   int hours = int.parse(totalMinutes) ~/ 60;
//   int minutes = int.parse(totalMinutes) % 60;

//   // Format with leading zeros if needed
//   String formattedHours = hours.toString().padLeft(2, '0');
//   String formattedMinutes = minutes.toString().padLeft(2, '0');

//   return "$formattedHours:$formattedMinutes";
// }

String convertMinutesToHHMM(String totalMinutes) {
  // Parse string as double first
  double totalMinutesDouble = double.tryParse(totalMinutes) ?? 0;

  // Convert to integer minutes
  int totalMinutesInt = totalMinutesDouble.toInt();

  int hours = totalMinutesInt ~/ 60;
  int minutes = totalMinutesInt % 60;

  // Format with leading zeros
  String formattedHours = hours.toString().padLeft(2, '0');
  String formattedMinutes = minutes.toString().padLeft(2, '0');

  return "$formattedHours:$formattedMinutes";
}

String generateRandomKaizenNo({
  String companyCode = 'PBL',
  String departmentCode = 'PP',
  String divisionCode = 'QA',
}) {
  // Generate random 4-digit number
  final random = Random();
  final number = (random.nextInt(9999) + 1).toString().padLeft(4, '0');

  return 'K/$companyCode/$departmentCode/$divisionCode/$number';
}

String generateRandomOPLNo({
  String companyCode = 'MHE',
  String departmentCode = 'PP',
}) {
  // Generate random 4-digit number
  final random = Random();
  final number = (random.nextInt(9999) + 1).toString().padLeft(4, '0');

  return 'TOPL/$companyCode/QA/$number';
}
